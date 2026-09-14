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
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_WITH_QML=OFF

sources:
- url: kde:frameworks/ki18n.git
  kind: git_repo
  track: v*
  exclude:
  - '*rc*'
  ref: dd9a8bed3ca7770d8a92815f83abebeaf6fc54d3
  ref-format: sha1
