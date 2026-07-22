# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '**/*'

sources:
- url: kde:frameworks/extra-cmake-modules.git
  kind: git_repo
  track: v*
  ref: 01dc9a0c05dd4851b01b93e961c9aa33b1e96056
  ref-format: sha1
