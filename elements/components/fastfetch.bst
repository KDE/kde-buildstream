# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/fastfetch/-/raw/main/PKGBUILD?ref_type=heads
kind: cmake

description: A feature-rich and performance oriented neofetch like system information tool

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/dbus.bst
- freedesktop-sdk.bst:components/libdrm.bst
- freedesktop-sdk.bst:components/libva.bst
- freedesktop-sdk.bst:components/sqlite.bst
- freedesktop-sdk.bst:components/vulkan-headers.bst
- freedesktop-sdk.bst:components/vulkan-icd-loader.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/zlib.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_FLASHFETCH=OFF
    -DBUILD_TESTS=OFF
    -DENABLE_SQLITE3=ON
    -DENABLE_RPM=OFF
    -DENABLE_IMAGEMAGICK6=OFF
    -DENABLE_SYSTEM_YYJSON=OFF
    -DPACKAGES_DISABLE_APK=ON
    -DPACKAGES_DISABLE_DPKG=ON
    -DPACKAGES_DISABLE_EMERGE=ON
    -DPACKAGES_DISABLE_EOPKG=ON
    -DPACKAGES_DISABLE_GUIX=ON
    -DPACKAGES_DISABLE_LINGLONG=ON
    -DPACKAGES_DISABLE_LPKG=ON
    -DPACKAGES_DISABLE_LPKGBUILD=ON
    -DPACKAGES_DISABLE_OPKG=ON
    -DPACKAGES_DISABLE_PACSTALL=ON
    -DPACKAGES_DISABLE_PALUDIS=ON
    -DPACKAGES_DISABLE_PKG=ON
    -DPACKAGES_DISABLE_PKGTOOL=ON
    -DPACKAGES_DISABLE_RPM=ON
    -DPACKAGES_DISABLE_SORCERY=ON
    -DPACKAGES_DISABLE_XBPS=ON
    -Wno-dev

sources:
- kind: git_repo
  url: github:fastfetch-cli/fastfetch.git
  track: '*'
  ref: 2.66.0-0-g08698098579bb8b043b0a343159b8018f5cea4fc
