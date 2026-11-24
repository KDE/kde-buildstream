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
- qt/qtlanguageserver.bst
- qt/qtshadertools.bst
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
  url: qt:qt/{major}.{minor}/{version}/submodules/qtdeclarative-everywhere-src-{version}.tar.xz
  ref:
    version: 6.12.1
    sha256sum: 91853e52d7ba958bfd85ea46b5efcf4a3b28b02e7bcd0e7c97a7b797ed6d1ecc
