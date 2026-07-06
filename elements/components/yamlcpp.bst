# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

# needed by calamares which is built in build.sh

kind: cmake

description: yaml-cpp C++ YAML parser and emitter library

sources:
- kind: git
  url: https://github.com/jbeder/yaml-cpp.git
  ref: 3a1c96f2180814a13587144b7f162f1e38ddda7d
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
