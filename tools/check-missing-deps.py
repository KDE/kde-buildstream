#!/usr/bin/env python3
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>

"""Fail if cmake or meson couldn't find something that isn't in missing-deps.yml.

Run it from the project directory right after `bst build TARGETS`, with the same
TARGETS. It reads the build logs bst just wrote locally. Elements pulled from the
cache have none, they got checked by the pipeline that built them.

missing-deps.yml maps element names to the dependencies they are allowed to
miss. Use '*' (quoted, a bare * is a YAML alias) to skip an element entirely:

    components/orca.bst:
    - systemd
    - python3 (psutil)
    components/foo.bst:
    - '*'

Names are compared case-insensitively.
"""

import argparse
import fnmatch
import os
import re
import subprocess
import sys
from pathlib import Path

from ruamel.yaml import YAML

ALLOWLIST = Path("missing-deps.yml")

MISSING = re.compile(
    r"Could NOT find ([^\s:(]+)"
    r'|Could not find a package configuration file provided by "([^"]+)"'
    r"|No package '([^']+)' found"
    r"|[Dd]ependency (\S+) found: NO"
    r"|Library (\S+) found: NO"
    r"|Program (.+?) found: NO"
)
# Lookups often fail with one method and succeed with the next, or fall back to a subproject.
FOUND = re.compile(
    r"--\s+Found ([^\s:,]+)"  # find_package() has one space, pkg_check_modules() three
    r"|[Dd]ependency (\S+) found: YES"
    r"|Library (\S+) found: YES"
    r"|Program (.+?) found: YES"
    r"|[Dd]ependency (\S+) from subproject"
    r"|fallback subproject for the dependency (\S+)"
)
# Items of cmake's feature_summary().
SUMMARY_ITEM = re.compile(r"^\s*\* ([^,\s]+)")
# Only needed for tests and docs.
IGNORE = {"valgrind", "gtest", "gmock", "pytest", "pytest-3 pytest", "python3 (pytest)", "check", "cunit",
          "cmocka", "pam_wrapper", "dbus-test-runner", "gdb", "doxygen", "git", "xsltproc", "sphinx-build"}
# Elements without a build log.
NO_LOG_KINDS = {"junction", "link"}

LOG_ROOT = Path(os.environ.get("XDG_CACHE_HOME", Path.home() / ".cache")) / "buildstream/logs"

yaml = YAML(typ="safe")


def load(path):
    with open(path, encoding="utf-8") as f:
        return yaml.load(f) or {}


def missing(log):
    deps, found, summary = set(), set(), None
    for line in log.splitlines():
        if "packages have not been found" in line:
            summary = deps
        elif "packages have been found" in line:
            summary = found
        elif line.startswith("--"):
            summary = None
        elif summary is not None and (item := SUMMARY_ITEM.match(line)):
            summary.add(item[1])
        for pattern, into in ((MISSING, deps), (FOUND, found)):
            into.update(m[m.lastindex] for m in pattern.finditer(line))
    found = {d.lower() for d in found} | IGNORE
    return {d for d in deps if d.lower() not in found}


def local_elements(element_path):
    return {p.relative_to(element_path).as_posix() for p in element_path.rglob("*.bst")
            if load(p).get("kind") not in NO_LOG_KINDS}


def select(elements, targets):
    """Elements matching bst style globs, e.g. components/**.bst."""
    return {e for e in elements if any(fnmatch.fnmatch(e, t) for t in targets)}


def cache_keys(targets):
    output = subprocess.run(["bst", "show", "--deps", "none", "--format", "%{name} %{full-key}", *targets],
                            check=True, stdout=subprocess.PIPE, text=True).stdout
    return dict(line.split() for line in output.splitlines() if line.count(" ") == 1)


def build_logs(log_dir, keys):
    """Newest local build log of each element for its current cache key.

    bst names the log dir after the element (/ -> -) and the log after the key's first characters,
    so logs of older builds of the element are left out.
    """
    logs = {}
    for element, key in keys.items():
        found = sorted((log for log in (log_dir / element.removesuffix(".bst").replace("/", "-")).glob("*-build.*.log")
                        if key.startswith(log.name.split("-")[0])),
                       key=lambda p: p.stat().st_mtime)
        if found:
            logs[element] = found[-1].read_text(errors="replace")
    return logs


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--print", action="store_true",
                        help="dump everything currently missing in allowlist format")
    parser.add_argument("targets", nargs="+", help="the targets passed to bst build")
    args = parser.parse_args()

    project = load("project.conf")
    elements = local_elements(Path(project.get("element-path", ".")))
    selected = select(elements, args.targets)
    logs = build_logs(LOG_ROOT / project["name"], {e: k for e, k in cache_keys(args.targets).items() if e in selected})
    if unlogged := len(selected - logs.keys()):
        print(f"note: skipped {unlogged} elements that weren't built here", file=sys.stderr)

    if args.print:
        dump = YAML(typ="safe")
        dump.default_flow_style = False
        dump.dump({element: sorted(deps, key=str.lower)
                   for element, log in sorted(logs.items()) if (deps := missing(log))}, sys.stdout)
        return 0

    # element -> {lowercased dep: dep as written}
    allowed = {element: {str(d).lower(): str(d) for d in deps or ()}
               for element, deps in load(ALLOWLIST).items()}
    for element in sorted(allowed.keys() - elements):
        print(f"warning: {ALLOWLIST}: {element} doesn't exist", file=sys.stderr)

    failed = False
    for element, log in sorted(logs.items()):
        ok = allowed.get(element, {})
        if "*" in ok:
            continue
        deps = {d.lower(): d for d in missing(log)}
        for dep in sorted(deps.keys() - ok.keys()):
            print(f"{element}: missing {deps[dep]}")
            failed = True
        for dep in sorted(ok.keys() - deps.keys()):
            print(f"warning: {ALLOWLIST}: {element}: {ok[dep]} isn't missing anymore", file=sys.stderr)

    if failed:
        print(f"\nAdd the dependencies or allow them in {ALLOWLIST}.", file=sys.stderr)
    return int(failed)


if __name__ == "__main__":
    sys.exit(main())
