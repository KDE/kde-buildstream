# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: >-
    -DZXING_DEPENDENCIES=LOCAL
    -DBUILD_SHARED_LIBS=ON
    -DZXING_UNIT_TESTS=OFF
    -DZXING_BLACKBOX_TESTS=OFF
    -DZXING_EXAMPLES=OFF
    -DZXING_C_API=OFF
    -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=TRUE

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
  exclude:
  - '*rc*'
  ref: v3.1.1-0-g287c85df6f961c8efbfb5ffd736cd9457b8b890e
- kind: git_module
  url: github:zint/zint.git
  path: zint
  ref: 55541e139e62b9209b71cd9b0ba9010cec28b1d9
