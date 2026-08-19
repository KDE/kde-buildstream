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
  ref: 0db3cf4e3e38360048bf8665efa74911ce4d2696
  ref-format: sha1
