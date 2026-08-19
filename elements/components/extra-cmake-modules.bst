# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '**/*'

sources:
- url: kde:frameworks/extra-cmake-modules.git
  kind: git_repo
  track: v*
  exclude:
  - '*rc*'
  ref: 42f0170593df4920068946494c6978ca7005217b
  ref-format: sha1
