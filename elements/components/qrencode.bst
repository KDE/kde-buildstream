# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: -DBUILD_SHARED_LIBS=ON -DWITH_TOOLS=OFF 
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git_repo
  url: github:fukuchi/libqrencode.git
  track: 'v*'
  ref: v4.1.1-0-g715e29fd4cd71b6e452ae0f4e36d917b43122ce8
