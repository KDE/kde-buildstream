# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

sources:
- url: https://github.com/AcademySoftwareFoundation/Imath.git
  kind: git_repo
  track: v*
  exclude:
  - '*rc*'
  - '*beta*'
  ref: 5f27ba266d3ea1565e912570c30b5eafc89959f1
  ref-format: sha1
