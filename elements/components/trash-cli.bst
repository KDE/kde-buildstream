# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/trash-cli/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: Command line trashcan (recycle bin) interface

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:andreafrancia/trash-cli.git
  track: '*'
  ref: 0.24.5.26-0-gc02fd350e6346da91404985e2d23fd5ab5256259
