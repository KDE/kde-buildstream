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
- qt/qtquick3d.bst
- qt/qtshadertools.bst
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
  url: qt:{major}.{minor}/{version}/submodules/qtquickeffectmaker-everywhere-src-{version}.tar.xz
  ref:
    version: 6.11.2
    sha256sum: 7923dc7284e933a5e36ae24a427564f04e0b27af8dfa38eee8092c01c2835cb7
