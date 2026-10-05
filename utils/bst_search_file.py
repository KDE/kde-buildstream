#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>

"""Find the BuildStream elements providing installed artifact paths."""

from __future__ import annotations

import argparse
import subprocess
from collections import defaultdict
from pathlib import Path

IGNORED_PROVIDERS = (
    "components/rust-src.bst",
    "-minimal.bst",
    "-static.bst",
)


def ignored_provider(element: str) -> bool:
    basename = element.rsplit("/", 1)[-1]
    stage = basename.removesuffix(".bst").rsplit("-stage", 1)
    return (
        "/_private/" in element
        or element.endswith(IGNORED_PROVIDERS)
        or basename.startswith("binary-seed")
        or (len(stage) == 2 and stage[1].isdigit())
    )


def public_provider(element: str, elements: set[str]) -> str | None:
    prefix, separator, path = element.rpartition(":")
    if not path.startswith("bootstrap/"):
        return element
    candidate = f"{prefix}{separator}components/{path.rsplit('/', 1)[-1]}"
    return candidate if candidate in elements else None


def run_bst(repo: Path, args: list[str]) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        ["bst", *args],
        cwd=repo,
        check=False,
        capture_output=True,
        text=True,
    )


def build_artifacts(repo: Path, target: str) -> None:
    elements = [
        name
        for name, (kind, state) in dependency_elements(repo, target).items()
        if kind != "stack" and state != "cached"
    ]
    if not elements:
        return
    result = run_bst(repo, ["build", *elements])
    if result.returncode:
        detail = (result.stderr or result.stdout).strip()
        message = f"Could not build the artifact closure for {target}"
        raise RuntimeError(f"{message}:\n{detail}" if detail else message)


def dependency_elements(repo: Path, target: str) -> dict[str, tuple[str, str]]:
    result = run_bst(
        repo,
        ["show", "--deps", "all", "--format", "%{name}|%{kind}|%{state}", target],
    )
    if result.returncode:
        raise RuntimeError(result.stderr.strip())
    elements = {}
    for line in result.stdout.splitlines():
        if not line.strip():
            continue
        name, kind, state = line.strip().split("|")
        if kind not in {"junction", "link"} and not ignored_provider(name):
            elements[name] = (kind, state)
    return elements


def parse_list_contents(
    output: str, elements: list[str], wanted: dict[str, set[str]]
) -> dict[str, set[str]]:
    providers: dict[str, set[str]] = defaultdict(set)
    current = elements[0] if len(elements) == 1 else None
    for line in output.splitlines():
        if line.startswith("  ") and line.endswith(":") and not line.startswith("    "):
            displayed = line.strip()[:-1]
            matches = [
                element
                for element in elements
                if element == displayed or element.endswith(":" + displayed)
            ]
            current = matches[0] if len(matches) == 1 else None
            continue
        entry = line.split(maxsplit=3)
        if len(entry) != 4 or entry[1] not in {"reg", "exe", "link"}:
            continue
        path = entry[3].split(" -> ", 1)[0].lstrip("/")
        if path.startswith("usr/lib/debug/"):
            continue
        if current is not None:
            for original in wanted.get(Path(path).name, set()):
                wanted_path = original.strip().lstrip("/")
                if (
                    original.startswith("/")
                    or "/" not in wanted_path
                    or path.endswith("/" + wanted_path)
                ):
                    providers[original].add(current)
    return dict(providers)


def providers_for_paths(
    repo: Path,
    target: str,
    paths: set[str],
) -> dict[str, set[str]]:
    closure = dependency_elements(repo, target)
    elements = [name for name, (kind, _) in closure.items() if kind != "stack"]
    element_set = set(closure)
    wanted: dict[str, set[str]] = defaultdict(set)
    for path in paths:
        wanted[Path(path.strip()).name].add(path)
    providers: dict[str, set[str]] = defaultdict(set)
    unavailable_artifacts: list[str] = []
    for offset in range(0, len(elements), 50):
        batch = elements[offset : offset + 50]
        result = run_bst(repo, ["artifact", "list-contents", "--long", *batch])
        unavailable = [
            line.strip()
            for line in result.stderr.splitlines()
            if " is not cached" in line
        ]
        if unavailable:
            unavailable_artifacts.extend(unavailable)
            continue
        if result.returncode:
            raise RuntimeError(result.stderr.strip())
        for path, found in parse_list_contents(result.stdout, batch, wanted).items():
            providers[path].update(
                public
                for provider in found
                if (public := public_provider(provider, element_set)) is not None
            )
    if unavailable_artifacts:
        raise RuntimeError(
            "Cannot search dependency providers: artifact contents are unavailable. "
            "Pull or build the missing artifacts before retrying.\n"
            + "\n".join(unavailable_artifacts)
        )
    # Prefer ordinary build dependencies over runtime-extension implementations.
    for path, found in providers.items():
        ordinary = {
            provider
            for provider in found
            if not provider.rsplit(":", 1)[-1].startswith("extensions/")
        }
        if ordinary:
            providers[path] = ordinary
    return dict(providers)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("filename")
    parser.add_argument("target", nargs="?")
    args = parser.parse_args()
    try:
        matches = providers_for_paths(Path.cwd(), args.target, {args.filename}).get(
            args.filename, set()
        )
    except RuntimeError as error:
        parser.exit(1, f"error: {error}\n")
    for element in sorted(matches):
        print(element)
    return 0 if matches else 1


if __name__ == "__main__":
    raise SystemExit(main())
