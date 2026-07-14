# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/podman-compose/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: A script to run docker-compose.yml using podman

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:containers/podman-compose.git
  track: 'v*'
  ref: v1.6.0-0-g0f6537e9cfa38f6035ac57c1716b6d55dbaf3ca4
