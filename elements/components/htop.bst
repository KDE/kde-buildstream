# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/htop/-/raw/main/PKGBUILD?ref_type=heads
kind: autotools

description: Interactive process viewer

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/libcap.bst
- freedesktop-sdk.bst:components/libnl.bst
- freedesktop-sdk.bst:bootstrap/ncurses.bst
- components/lm-sensors.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --enable-affinity
    --enable-capabilities
    --enable-delayacct
    --enable-openvz
    --enable-sensors
    --enable-unicode
    --enable-vserver

sources:
- kind: git_repo
  url: github:htop-dev/htop.git
  track: '*'
  exclude:
  - '*rc*'
  - '*beta*'
  ref: 3.5.3-0-g20882b8ef8271fb49ea0eb74bbfd484e9b0a11d8
