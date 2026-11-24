# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- components/openexr-imath.bst
- components/OpenJPH.bst

variables:
  cmake-local: -DOPENEXR_BUILD_TOOLS=OFF -DOPENEXR_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF

sources:
- url: github:AcademySoftwareFoundation/openexr.git
  kind: git_repo
  track: v*
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha*'
  ref: 486e238dd28ba6fed22528005b05f9f15bef0cc0
  ref-format: sha1
