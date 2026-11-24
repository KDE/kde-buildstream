# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
depends:
- freedesktop-sdk.bst:components/hunspell.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
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
  url: qt:qt/{major}.{minor}/{version}/submodules/qtvirtualkeyboard-everywhere-src-{version}.tar.xz
  ref:
    version: 6.12.1
    sha256sum: cafb30cf36bc67c486911da05f04ddc8f2e2965540999078aeff7ed809d1803c
