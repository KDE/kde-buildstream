# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

description: Calamares system installer

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- components/extra-cmake-modules.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- qt.bst
- components/polkit-qt-1.bst
- components/yamlcpp.bst
- components/kcoreaddons.bst
- components/ki18n.bst
- components/kpmcore.bst
- components/kwidgetsaddons.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DWITH_QT6=ON

sources:
- kind: git_repo
  url: https://codeberg.org/Calamares/calamares.git
  track: v*
  ref: v3.4.2-0-g36d30c492e5c7b5d6d32fed5c5d9790522e1eea3
