# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/docker-compose/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: Fast, isolated development environments using Docker

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:docker/compose.git
  track: 'v*'
  exclude:
  - '*rc*'
  ref: v5.6.1-0-g6cbc19a3fd59e305fb814dca4d854a4fb67d2941
