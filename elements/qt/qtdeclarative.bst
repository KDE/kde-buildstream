# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
- qt/qtbase.bst
- qt/qttools.bst
- qt/qtshadertools.bst
- qt/qtlanguageserver.bst
variables:
  cmake-local: -DQT_TOOL_COMMAND_WRAPPER_PATH=env
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
        - '**/lib/plugins/qmltooling'
        - '**/lib/plugins/qmltooling/**'
sources:
- kind: anitya
  project-id: 7927
  url: 'qt:{major}.{minor}/{version}/submodules/qtdeclarative-everywhere-src-{version}.tar.xz'
  ref:
    version: 6.11.2
    sha256sum: 215b7b70517e380123eabc6b92243f3c47b6f016a91d126057dbe53551c6b430
