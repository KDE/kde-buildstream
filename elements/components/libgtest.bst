# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

sources:
- kind: git_repo
  url: github:google/googletest.git
  track: 'v*'
  exclude:
  - '*pre*'
  ref: v1.18.0-0-g063de7e9578f82b369302001269680b4b1553359

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
