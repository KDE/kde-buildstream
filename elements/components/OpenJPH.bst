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
  ref: 345a8bcd1c7a3908e3870797057277660a412073
  ref-format: sha1
