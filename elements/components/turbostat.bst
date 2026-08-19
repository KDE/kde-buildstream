# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/linux-tools/-/raw/main/PKGBUILD?ref_type=heads

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:components/libcap.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands:
  - make -C tools/power/x86/turbostat
  install-commands:
  - make -C tools/power/x86/turbostat DESTDIR="%{install-root}" install

sources:
- kind: anitya
  project-id: 358810
  url: 'https://cdn.kernel.org/pub/linux/kernel/v{major}.x/linux-{version}.tar.xz'
  ref:
    version: 7.2
    sha256sum: f9fef3d14c0df53819026f4be74459835c2a0b0dcbf5b5bbd9ea19f0829402b3
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/linux-tools/-/raw/main/usbipd.service?ref_type=heads
  ref: 2e187734d8aec58a3046d79883510d779aa93fb3ab20bd3132c1a607ebe5498f
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/linux-tools/-/raw/main/hv_kvp_daemon.service?ref_type=heads
  ref: b1315cb77a35454e1af9172f821a52e2a0cb18561be05a340d21cf337b01ae61
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/linux-tools/-/raw/main/hv_vss_daemon.service?ref_type=heads
  ref: 2d5e2f8d40b6f19bf2e1dead57ca105d72098fb0b418c09ff2e0cb91089710af
