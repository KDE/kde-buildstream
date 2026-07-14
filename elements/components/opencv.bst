# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: -DCMAKE_BUILD_TYPE=Release -DOPENCV_GENERATE_PKGCONFIG=ON -DBUILD_LIST=imgproc

sources:
- kind: git_repo
  url: github:opencv/opencv.git
  track: '*'
  ref: 5.0.0-alpha-0-g616fd509478bce17749cbc94852a1cc50d1e8f06
- kind: git_repo
  url: github:opencv/opencv_contrib.git
  track: '*'
  ref: 5.0.0-alpha-0-g712f9758c57edcefa99fc5ff6674352decc3cf31
