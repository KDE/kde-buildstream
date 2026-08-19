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
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF

sources:
- url: kde:frameworks/kcoreaddons.git
  kind: git_repo
  track: v*
  exclude:
  - '*rc*'
  ref: 8ce411949768ea1d41ab090cb9a9f3089ee73233
  ref-format: sha1
