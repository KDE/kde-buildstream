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
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha*'
  ref: 5.0.0-0-g40738fb16ceddb5fb3fea747585f7ce6abb0605b
- kind: git_repo
  url: github:opencv/opencv_contrib.git
  track: '*'
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha*'
  ref: 5.0.0-0-g755e50675d97db9b7d449d8bd6b09888646f6c6e
