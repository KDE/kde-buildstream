# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
variables:
  arch-cmake-local: ''
  cmake-local: -DINSTALL_ARCHDATADIR=lib -DQT_CREATE_VERSIONED_HARD_LINK=OFF -DQT_DISABLE_RPATH=ON -DBUILD_WITH_PCH=FALSE -DQT_FEATURE_openssl_linked=ON -DQT_FEATURE_system_sqlite=ON %{arch-cmake-local}
(?):
- arch == 'x86_64':
    variables:
      arch-cmake-local: -DINSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu
- arch == 'aarch64':
    variables:
      arch-cmake-local: -DINSTALL_LIBDIR=/usr/lib/aarch64-linux-gnu
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
  url: 'qt:{major}.{minor}/{version}/submodules/qtbase-everywhere-src-{version}.tar.xz'
  ref:
    version: 6.11.2
    sha256sum: 5b2e00eccaf5a4d8c14134ffa0ea8dfd0a35ae1ffc7f8d87fa4305a1ed23cf22
- kind: patch
  path: elements/qt/patch/qtbase-find_package-paths.patch
- kind: patch
  path: elements/qt/patch/qtbase-use-adwaita-decorations-on-gnome-by-default.patch
