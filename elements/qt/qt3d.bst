# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
depends:
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/vulkan-headers.bst
- freedesktop-sdk.bst:components/vulkan-icd-loader.bst
- qt/qtbase.bst
- qt/qtdeclarative.bst
- qt/qtmultimedia.bst
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
  url: qt:qt/{major}.{minor}/{version}/submodules/qt3d-everywhere-src-{version}.tar.xz
  ref:
    version: 6.12.1
    sha256sum: e5f062d3c9ca492e1e2e172f7bf0e35be529805b1294d0b734d77222daad4849
