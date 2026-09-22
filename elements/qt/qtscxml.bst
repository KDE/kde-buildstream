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
  url: qt:{major}.{minor}/{version}/submodules/qtscxml-everywhere-src-{version}.tar.xz
  ref:
    version: 6.11.2
    sha256sum: f594c4bba7f8bffb20857973c72895669d6e54df08c8d897f50d15251cec35ff
