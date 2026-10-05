#!/usr/bin/python3

# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2014 Aleix Pol Gonzalez <aleixpol@kde.org>

import argparse
import json
import lzma
import os
import re
from pathlib import Path
from typing import Any, BinaryIO, TextIO

IGNORED_FIND_MODULES = {
    "FindPackageHandleStandardArgs.cmake",
    "FindPackageMessage.cmake",
    "FindOpenMP.cmake",
    "FindPkgConfig.cmake",
    "FindThreads.cmake",
}
FIND_KEYWORDS = {
    "CMAKE_FIND_ROOT_PATH_BOTH",
    "DOC",
    "HINTS",
    "NAMES",
    "NAMES_PER_DIR",
    "NO_CACHE",
    "NO_CMAKE_ENVIRONMENT_PATH",
    "NO_CMAKE_FIND_ROOT_PATH",
    "NO_CMAKE_INSTALL_PREFIX",
    "NO_CMAKE_PATH",
    "NO_CMAKE_SYSTEM_PATH",
    "NO_DEFAULT_PATH",
    "NO_PACKAGE_ROOT_PATH",
    "NO_SYSTEM_ENVIRONMENT_PATH",
    "ONLY_CMAKE_FIND_ROOT_PATH",
    "PATHS",
    "PATH_SUFFIXES",
    "REQUIRED",
    "VALIDATOR",
}


def qmlModuleFile(moduleName: str) -> str:
    return moduleName.replace(".", "/") + "/qmldir"


def findCandidates(kind: str, arguments: str) -> set[str]:
    tokens = [token for token in re.split(r"[;\s]+", arguments) if token]
    if len(tokens) < 2:
        return set()
    try:
        start = tokens.index("NAMES") + 1
    except ValueError:
        names = tokens[1:2]
    else:
        names = []
        for token in tokens[start:]:
            if token in FIND_KEYWORDS:
                break
            if not token.startswith(("$", "[")):
                names.append(token)
    if kind == "library":
        return {
            candidate
            for name in names
            for candidate in (
                f"{name if name.startswith('lib') else 'lib' + name}.so",
                f"{name if name.startswith('lib') else 'lib' + name}.a",
            )
        }
    return set(names)


def pythonImportCandidates(arguments: str) -> set[str]:
    command = re.match(
        r"\s*COMMAND\s+(?:\$\{[^}]*[Pp]ython[^}]*\}|[^\s;)\/]*[Pp]ython[\d.]*|[^\s;)]*\/[Pp]ython[\d.]*)\s+(.*)",
        arguments,
    )
    if command is None:
        return set()
    imported = re.search(
        r"(?:^|[;\s])-c[;\s]+(?:import|from)[;\s]+([A-Za-z_]\w*(?:\.[A-Za-z_]\w*)*)",
        command.group(1),
    )
    if imported is None:
        return set()
    return {imported.group(1).replace(".", "/") + "/__init__.py"}


def processProvidedFiles(trace: BinaryIO) -> set[str]:
    provided: set[str] = set()
    for line in trace:
        theLine = line.decode("utf-8")
        if "_add_qml_module(" in theLine:
            match = re.match(
                r".*?:\s*(?:ecm|qt)_add_qml_module\(.*?\bURI\s+([^\s;)]+)",
                theLine,
            )
            if match is not None and not match.group(1).startswith(("$", "[")):
                provided.add(qmlModuleFile(match.group(1)))
        if "install(FILES " not in theLine:
            continue
        match = re.match(".*?:\\s*install\\(FILES (.*?) DESTINATION .*", theLine)
        if match is None:
            continue
        for filename in match.group(1).split(" "):
            if not filename.endswith(("Config.cmake", "ConfigVersion.cmake", ".pc")):
                continue
            provided.add(Path(filename).name)
    return provided


def readCache(f: TextIO, varName: str) -> str | None:
    f.seek(0)
    for line in f:
        m = re.match("(.*?)=(.*)", line)
        if m is not None and m.group(1) == varName:
            return m.group(2)
    return None


def checkPackageVersion(
    cacheFile: TextIO | None, frameworkName: str
) -> dict[str, str | None] | None:
    if cacheFile is None:
        return None
    value = readCache(
        cacheFile, "FIND_PACKAGE_MESSAGE_DETAILS_%s:INTERNAL" % frameworkName
    )
    if value is None:
        return None
    m = re.match(".*\\]\\[v(.*?)\\((.*?)\\)\\]", value)
    if m:
        return {"used": m.group(1), "requested": m.group(2)}
    return None


def processLog(
    trace: BinaryIO,
    cacheFile: TextIO | None = None,
    cargoLocks: set[str] | None = None,
    cargoProject: str | None = None,
) -> list[dict[str, Any]]:
    processedFiles: dict[str, dict[str, Any]] = {}
    lookedUpPackages: dict[str, str] = {}
    projectRoot: Path | None = None

    lastFile = ""
    callingFile = ""
    for line in trace:
        theLine = line.decode("utf-8")

        if (
            cargoLocks is not None
            and cargoProject is not None
            and "Cargo.toml" in theLine
        ):
            for manifest in re.findall(r"/builds/[^\s;()]+/Cargo\.toml", theLine):
                marker = f"/{cargoProject}/"
                if marker not in manifest:
                    continue
                relative = manifest.rsplit(marker, 1)[1]
                if not relative.startswith(("_build/", "build/")):
                    cargoLocks.add(str(Path(relative).with_name("Cargo.lock")))

        m = None
        if "ecm_find_qmlmodule(" in theLine:
            m = re.match(r".*?:\s*ecm_find_qmlmodule\(([^\s;)]+)", theLine)
        if m is not None and not m.group(1).startswith(("$", "[")):
            moduleName = m.group(1)
            processedFiles.setdefault(
                moduleName,
                {"files": set(), "explicit": True, "version": None},
            )["files"].add(qmlModuleFile(moduleName))

        m = None
        if "pkg_" in theLine or "PKG_" in theLine:
            m = re.match(
                ".*?:\\s*pkg_(?:check_modules|search_module)\\((.*?)\\).*",
                theLine,
                re.IGNORECASE,
            )
        if m is not None:
            arguments = m.group(1).split()
            for moduleName in arguments[1:]:
                if moduleName in {
                    "REQUIRED",
                    "QUIET",
                    "NO_CMAKE_PATH",
                    "NO_CMAKE_ENVIRONMENT_PATH",
                    "IMPORTED_TARGET",
                    "GLOBAL",
                } or moduleName.startswith(("$", "_")):
                    continue
                moduleName = re.split("[<=>]", moduleName, maxsplit=1)[0]
                if not moduleName or re.fullmatch(r"\d+(?:\.\d+)*", moduleName):
                    continue
                if moduleName not in processedFiles:
                    processedFiles[moduleName] = {
                        "files": set(),
                        "explicit": True,
                        "version": None,
                    }
                processedFiles[moduleName]["files"].add(moduleName + ".pc")

        m = None
        if "find_package(" in theLine:
            m = re.match(".*?:\\s*find_package\\((.*?) (.*?)\\).*", theLine)
        if m is not None:
            if (
                "$" not in m.group(2)
                and f"Find{m.group(1)}.cmake" not in IGNORED_FIND_MODULES
            ):
                lookedUpPackages[m.group(1)] = m.group(2)

        # match file names
        # e.g./usr/share/cmake-3.0/Modules/FindPackageMessage.cmake(46):  set(...
        opening_parenthesis = theLine.find("(")
        if theLine.startswith("/") and opening_parenthesis > 0:
            currentFile = theLine[:opening_parenthesis]
            # CMake's trace-expand output annotates calls evaluated through
            # cmake_language(EVAL) as ``file:line:EVAL(n)``.  The annotation
            # is trace metadata, not part of the source filename.
            currentFile = re.sub(r":\d+(?::[A-Za-z_]+)?$", "", currentFile)
            if lastFile != currentFile:
                callingFile = lastFile
            lastFile = currentFile
            _, fileName = os.path.split(currentFile)

            if fileName == "CMakeLists.txt":
                if projectRoot is None:
                    projectRoot = Path(currentFile).parent
                continue
            if fileName in IGNORED_FIND_MODULES:
                continue

            m = re.fullmatch(
                r"(.+?)(?:Config(?:Version)?|-config(?:-version)?)\.cmake",
                fileName,
            )
            m2 = re.match("Find(.*).cmake", fileName)
            if m2:
                moduleName = m2.group(1)
            elif m:
                moduleName = m.group(1)
            else:
                continue

            if moduleName not in processedFiles:
                processedFiles[moduleName] = {"files": set(), "explicit": False}

            if "version" not in processedFiles[moduleName]:
                processedFiles[moduleName]["version"] = checkPackageVersion(
                    cacheFile, moduleName
                )

            processedFiles[moduleName]["files"].add(currentFile)
            calledFromProject = (
                projectRoot is not None
                and Path(callingFile).is_relative_to(projectRoot)
                and "/_install/" not in callingFile
            )
            processedFiles[moduleName]["explicit"] |= (
                callingFile.endswith("CMakeLists.txt")
                or callingFile.endswith("Qt6/Qt6Config.cmake")
                or callingFile.endswith("FindKF6.cmake")
                or calledFromProject
            )
            find = re.match(
                r".*?:\s*find_(program|path|file|library)\((.*?)\).*", theLine
            )
            if find and m2:
                processedFiles[moduleName].setdefault("candidates", set()).update(
                    findCandidates(find.group(1), find.group(2))
                )
            execute = None
            if m2 and "execute_process(" in theLine:
                execute = re.match(r".*?:\s*execute_process\((.*?)\).*", theLine)
            if execute:
                candidates = pythonImportCandidates(execute.group(1))
                if candidates:
                    processedFiles[moduleName].setdefault("candidates", set()).update(
                        candidates
                    )
            if m2 and re.match(
                r".*?:\s*pkg_(?:check_modules|search_module)\(",
                theLine,
                re.IGNORECASE,
            ):
                processedFiles[moduleName]["pkg_config"] = True

    deps: list[dict[str, Any]] = []
    for v, value in processedFiles.items():
        value["files"] = list(value["files"])
        if "candidates" in value:
            value["candidates"] = sorted(value["candidates"])
        value["project"] = v
        if v in lookedUpPackages:
            if value["version"] is None:
                line = lookedUpPackages[v]
                isVersion = line[: line.find(" ")]

                if len(isVersion) > 0 and isVersion[0].isdigit():
                    value["version"] = {"used": None, "requested": isVersion}

            del lookedUpPackages[v]

        deps.append(value)

    # display missing packages
    for v, arguments in lookedUpPackages.items():
        deps.append(
            {
                "project": v,
                "missing": True,
                "files": [],
                "arguments": arguments,
                "explicit": True,
            }
        )

    return deps


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Figures out dependencies from a captured CMake trace."
    )
    parser.add_argument("--trace-file", required=True)
    parser.add_argument(
        "--cache-file",
        default="CMakeCache.txt",
        help="optional CMake cache used only for version information",
    )
    arguments = parser.parse_args()

    cachePath = Path(arguments.cache_file)
    cacheFile = cachePath.open("r") if cachePath.is_file() else None

    tracePath = Path(arguments.trace_file)
    trace = (
        lzma.open(tracePath, "rb")
        if tracePath.suffix == ".xz"
        else tracePath.open("rb")
    )
    with trace:
        deps = processLog(trace, cacheFile)
    print(json.dumps(deps, indent=4))
