# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by Arch Linux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/icmake/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: A program maintenance utility using a C-like grammar

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:components/git.bst
- freedesktop-sdk.bst:components/libunwind.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libunwind.bst

variables:
  command-subdir: icmake

config:
  build-commands:
  - ./prepare buildstream
  - sed -i 's/^extern char \*\*environ;/extern "C" char **environ;/' exec/stack/stack.ih
  - TAR_OPTIONS=--no-same-owner CXXFLAGS="${CXXFLAGS/ -Wp,-D_GLIBCXX_ASSERTIONS/} -std=c++26" ./buildlib buildstream
  - CXXFLAGS="${CXXFLAGS/ -Wp,-D_GLIBCXX_ASSERTIONS/} -std=c++26" ./build all
  install-commands:
  - ./install all "%{install-root}"

sources:
- kind: git_repo
  url: gitlab:fbb-git/icmake.git
  track: 13.*
  ref: 13.05.01-0-g650f438dd0f8bc9ea1fbf0bc1813c0cb7d2aa022
