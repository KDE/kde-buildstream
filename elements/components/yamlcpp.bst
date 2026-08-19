# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

# needed by calamares which is built in build.sh

kind: cmake

description: yaml-cpp C++ YAML parser and emitter library

sources:
- kind: git_repo
  url: https://github.com/jbeder/yaml-cpp.git
  ref: yaml-cpp-0.9.0-67-gc3f81127320662deb3e28f4da0a511f1faecd860
  track: master

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DYAML_CPP_BUILD_TESTS=OFF
    -DYAML_CPP_BUILD_TOOLS=OFF
    -DYAML_BUILD_SHARED_LIBS=OFF
    -DCMAKE_BUILD_TYPE=Release
