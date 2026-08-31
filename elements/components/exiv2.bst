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
  exclude:
  - '*rc*'
  - '*pre*'
  ref: v0.28.9-0-gb0859fc61fea5dedfc898aece6b15893ddf4314e
