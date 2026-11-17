#!/usr/bin/env python3
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>

"""Fail if cmake or meson couldn't find something that isn't in missing-deps.yml.

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

# `bst artifact log` prints the logs back to back, each starting with this header.
LOG_HEADER = re.compile(r"^(?=BuildStream \S+ - )", re.M)
LOG_START = re.compile(r"^\S+ START\s+\[\w+\] (\S+\.bst): Build", re.M)

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


def local_elements():
    element_path = Path(load("project.conf").get("element-path", "."))
    return {str(p.relative_to(element_path)) for p in element_path.rglob("*.bst")
            if load(p).get("kind") not in NO_LOG_KINDS}


def build_logs(elements):
    # Read the logs from the artifacts so pulled elements get checked too. --out can't
    # handle elements in subdirectories, so split stdout at each log's header instead.
    output = subprocess.run(["bst", "artifact", "log", *sorted(elements)], check=True,
                            stdout=subprocess.PIPE, text=True, errors="replace").stdout
    logs = {}
    for log in LOG_HEADER.split(output):
        m = LOG_START.search(log)
        if m and m[1] in elements:
            logs[m[1]] = logs.get(m[1], "") + log
    return logs


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--print", action="store_true",
                        help="dump everything currently missing in allowlist format")
    args = parser.parse_args()
    os.chdir(Path(__file__).resolve().parent.parent)

    elements = local_elements()
    logs = build_logs(elements)
    if unlogged := len(elements - logs.keys()):
        print(f"note: skipped {unlogged} elements without a cached build log", file=sys.stderr)

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
