# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
depends:
- freedesktop-sdk.bst:components/libxkbcommon.bst
- qt/qtbase.bst
- qt/qtdeclarative.bst
- qt/qtwebengine.bst
sources:
- kind: anitya
  project-id: 239868
  url: qt:{major}.{minor}/{version}/submodules/qtwebview-everywhere-src-{version}.tar.xz
  ref:
    version: 6.12.0
    sha256sum: bee0642225614d7fc9486a2ca6db7d2c82a28c311404d1503185a360792c504e
