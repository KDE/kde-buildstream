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
  ref: c68064d0e4cad8e96bab9a068f6cc4e7799744fc
  ref-format: sha1
