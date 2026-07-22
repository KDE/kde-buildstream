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
  track: '*'
  ref: 1ce857c7f14dd78dd8f4bdfabe43dc17f8408a42
  ref-format: sha1
