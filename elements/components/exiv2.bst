# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: -DEXIV2_BUILD_EXIV2_COMMAND=OFF -DEXIV2_BUILD_SAMPLES=OFF -DEXIV2_ENABLE_INIH=OFF -DEXIV2_ENABLE_VIDEO=OFF

sources:
- kind: git_repo
  url: github:Exiv2/exiv2.git
  track: v*
  ref: v0.28.8-0-g2cd987a731236037b6b78cbff897d08685a8ef49
