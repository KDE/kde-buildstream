# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Draft generated from Arch PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/clazy/-/raw/main/PKGBUILD?ref_type=heads
description: Qt oriented code checker based on clang framework

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/llvm.bst

sources:
- kind: git_repo
  url: kde:sdk/clazy
  track: 'v*'
  ref: 1.15-0-g9f3f8acc7573d40cbd8ab4324058f64049e97667
