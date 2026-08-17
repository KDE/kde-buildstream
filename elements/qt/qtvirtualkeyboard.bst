# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
- qt/qtbase.bst
- qt/qtdeclarative.bst
- qt/qtmultimedia.bst
- qt/qtsvg.bst
public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{prefix}/bin'
        - '%{prefix}/bin/**'
sources:
- kind: anitya
  project-id: 7927
  url: 'qt:{major}.{minor}/{version}/submodules/qtvirtualkeyboard-everywhere-src-{version}.tar.xz'
  ref:
    version: 6.11.1
    sha256sum: a1c6967b326243b2ca8d50bc7b7f7852c3975d9aa6ce4b186ebdf35bb1007e1c
