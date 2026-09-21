# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: -DOJPH_ENABLE_TIFF_SUPPORT=OFF -DOJPH_BUILD_EXECUTABLES=OFF

sources:
- url: https://github.com/aous72/OpenJPH.git
  kind: git_repo
  track: '*.*.*'
  ref: 23c422895ce6c3a156935222e4715ee0b7be952c
  ref-format: sha1
