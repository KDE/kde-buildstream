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
  url: 'qt:{major}.{minor}/{version}/submodules/qtlanguageserver-everywhere-src-{version}.tar.xz'
  ref:
    version: 6.11.2
    sha256sum: 38bc4272ecf4ca0eb1927227053e52be6b2e05733f46d03422306aace511fc5e
