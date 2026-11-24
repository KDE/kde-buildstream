# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
depends:
- freedesktop-sdk.bst:components/bluez-libs.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/pcsc-lite.bst
- qt/qtbase.bst
- qt/qtdeclarative.bst
environment:
  INSTALL_ROOT: '%{install-root}'
  FLATPAK_DEST: '%{prefix}'
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
  url: qt:qt/{major}.{minor}/{version}/submodules/qtconnectivity-everywhere-src-{version}.tar.xz
  ref:
    version: 6.12.1
    sha256sum: e0319d2f365bc128b45b051ac9de54240279d26188256bb9b1e89d3a99f3be62
