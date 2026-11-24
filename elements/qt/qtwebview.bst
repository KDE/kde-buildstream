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
  url: qt:qt/{major}.{minor}/{version}/submodules/qtwebview-everywhere-src-{version}.tar.xz
  ref:
    version: 6.12.1
    sha256sum: 4b42a261247b0c6188216d026754c2c779f622a1e5cca5b863339e36c1332798
