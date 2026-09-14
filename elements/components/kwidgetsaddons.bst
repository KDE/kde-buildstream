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
  exclude:
  - '*rc*'
  ref: 759d687197173e4da56f7fab2bebdd9e9f3de0bb
  ref-format: sha1
