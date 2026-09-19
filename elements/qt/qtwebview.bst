# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst

depends:
- qt/qtbase.bst
- qt/qtdeclarative.bst
- qt/qtwebengine.bst
sources:
- kind: anitya
  project-id: 239868
  url: 'qt:{major}.{minor}/{version}/submodules/qtwebview-everywhere-src-{version}.tar.xz'
  ref:
    version: 6.11.2
    sha256sum: 7e21e109ee89dadeef2d3edd786bcb9d64a5562ea546f89dcc79b3f52f881f4c
