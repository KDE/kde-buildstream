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
    version: 6.11.2
    sha256sum: 4c6a26734a5c4e4acd5ff9ae5f192a5b883bc4514118f9df2fcf12064e647c2f
