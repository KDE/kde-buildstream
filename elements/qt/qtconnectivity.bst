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
  url: qt:{major}.{minor}/{version}/submodules/qtconnectivity-everywhere-src-{version}.tar.xz
  ref:
    version: 6.11.2
    sha256sum: 85b01a57bd059583ab520a857990dfdf4021447507ff5b9498f036b7295e6037
