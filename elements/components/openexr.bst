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
- url: https://github.com/AcademySoftwareFoundation/openexr.git
  kind: git_repo
  track: v*
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha*'
  ref: 3950290530c4fd4776667d0dc4d65a9d003eb936
  ref-format: sha1
