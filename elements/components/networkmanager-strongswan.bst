# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/networkmanager-strongswan/-/raw/main/PKGBUILD?ref_type=heads
description: Strongswan NetworkManager plugin

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/openssl.bst

sources:
- kind: anitya
  project-id: 4899
  url: 'https://download.strongswan.org/strongswan-{version}.tar.bz2'
  ref:
    version: 6.0.7
    sha256sum: e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55
