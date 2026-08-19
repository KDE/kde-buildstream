# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
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
  url: 'qt:{major}.{minor}/{version}/submodules/qttools-everywhere-src-{version}.tar.xz'
  ref:
    version: 6.11.2
    sha256sum: 9ea75af35c512f7e09e61c8c3af3997f13b4d43bb099cf43fcec470126b4041e
