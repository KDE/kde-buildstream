# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: EditorConfig core code written in C (for use by plugins supporting EditorConfig parsing)

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/sed.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/pcre2.bst

variables:
  cmake-local: -DBUILD_DOCUMENTATION=OFF

config:
  configure-commands:
  - sed -i s/-Werror// src/CMakeLists.txt
  - "%{cmake}"

sources:
- kind: git_repo
  url: github:editorconfig/editorconfig-core-c
  track: 'v*'
  exclude:
  - '*beta*'
  - '*alpha*'
  ref: v0.12.11-0-g0ba157eff167c1b2d1bc0c3e13975b7a73fb9d25
