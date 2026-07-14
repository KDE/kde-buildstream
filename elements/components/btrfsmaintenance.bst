# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/btrfsmaintenance/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: Btrfs maintenance scripts

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:kdave/btrfsmaintenance.git
  track: 'v*'
  ref: v0.5.2-0-gbeb9e2d166cbd856297fe8d28e89e8b36961a723
