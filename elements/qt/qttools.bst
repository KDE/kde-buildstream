# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
depends:
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:components/zstd.bst
- qt/qtbase.bst
environment:
  INSTALL_ROOT: '%{install-root}'
  FLATPAK_DEST: '%{prefix}'
public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{prefix}/bin/assistant'
        - '%{prefix}/bin/assistant/**'
        - '%{prefix}/bin/qhelpgenerator'
        - '%{prefix}/bin/qhelpgenerator/**'
        - '%{prefix}/bin/qcollectiongenerator'
        - '%{prefix}/bin/qcollectiongenerator/**'
        - '%{prefix}/bin/qhelpconverter'
        - '%{prefix}/bin/qhelpconverter/**'
        - '%{prefix}/bin/pixeltool'
        - '%{prefix}/bin/pixeltool/**'
        - '%{prefix}/bin/designer'
        - '%{prefix}/bin/designer/**'
        - '%{prefix}/bin/lrelease'
        - '%{prefix}/bin/lrelease/**'
        - '%{prefix}/bin/lupdate'
        - '%{prefix}/bin/lupdate/**'
        - '%{prefix}/bin/lconvert'
        - '%{prefix}/bin/lconvert/**'
        - '%{prefix}/bin/linguist'
        - '%{prefix}/bin/linguist/**'
        - '%{prefix}/bin/qdoc'
        - '%{prefix}/bin/qdoc/**'
        - '%{prefix}/bin/qtattributionsscanner'
        - '%{prefix}/bin/qtattributionsscanner/**'
        - '%{prefix}/bin/qtplugininfo'
        - '%{prefix}/bin/qtplugininfo/**'
        - '%{prefix}/bin/qtdiag'
        - '%{prefix}/bin/qtdiag/**'
        - '%{prefix}/bin/qdbusviewer'
        - '%{prefix}/bin/qdbusviewer/**'
sources:
- kind: anitya
  project-id: 7927
  url: qt:{major}.{minor}/{version}/submodules/qttools-everywhere-src-{version}.tar.xz
  ref:
    version: 6.12.0
    sha256sum: 8dab8f3611496486a470ad5f115ceea584f36bc22a2b8b6f6ebdbafbb8160693
