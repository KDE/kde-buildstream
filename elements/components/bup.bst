# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/bup/-/raw/main/PKGBUILD?ref_type=heads
kind: make

description: Efficient backup system based on the git packfile format

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/git.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:bup/bup
  track: '*'
  exclude:
  - '*rc*'
  ref: 0.34-0-g66045833e9905a4b0807ac501339920c3c1118c1
