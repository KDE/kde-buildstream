# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: C library for reading, creating, and modifying zip archives

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/openssl.bst
- freedesktop-sdk.bst:components/bzip2.bst
- freedesktop-sdk.bst:components/xz.bst
- freedesktop-sdk.bst:components/zlib.bst
- freedesktop-sdk.bst:components/zstd.bst

variables:
  cmake-local: -DENABLE_GNUTLS=OFF -DBUILD_REGRESS=OFF -DBUILD_EXAMPLES=OFF

sources:
- kind: anitya
  project-id: 10649
  url: https://libzip.org/download/libzip-{version}.tar.xz
  ref:
    version: 1.11.4
    sha256sum: 8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b
