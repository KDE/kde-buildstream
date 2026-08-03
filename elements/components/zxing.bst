# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: -DBUILD_DEPENDENCIES=LOCAL -DBUILD_SHARED_LIBS=ON -DBUILD_UNIT_TESTS=OFF -DBUILD_BLACKBOX_TESTS=OFF -DBUILD_EXAMPLES=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{prefix}/include/ZXing'
        - '%{prefix}/include/ZXing/**'
        - '**/*.pc'
        - '%{prefix}/lib/*/cmake/ZXing'
        - '**/libZXing.so'
        - '**/libZXing.so/**'

sources:
- kind: git_repo
  url: github:zxing-cpp/zxing-cpp.git
  track: v*
  ref: v3.1.1-0-g287c85df6f961c8efbfb5ffd736cd9457b8b890e
