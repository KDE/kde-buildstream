# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by Arch Linux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/yodl/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: A pre-document language and document-processing tools

build-depends:
- freedesktop-sdk.bst:sdk.bst
- components/icmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  command-subdir: yodl

config:
  build-commands:
  - ./build programs
  - ./build macros
  install-commands:
  - ./build install programs "%{install-root}"
  - ./build install macros "%{install-root}"

sources:
- kind: git_repo
  url: gitlab:fbb-git/yodl.git
  track: '*.*'
  ref: 4.05.01-0-gaff9896eda0cc9f831729a7359af4b6a37e99d48
