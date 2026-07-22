# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
- components/extra-cmake-modules.bst
- qt.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '**/*'

variables:
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF -DBUILD_DESIGNERPLUGIN=OFF

sources:
- url: kde:frameworks/kwidgetsaddons.git
  kind: git_repo
  track: v*
  ref: 0e7b826043dfcf96aef53565d164d40a467f4c19
  ref-format: sha1
