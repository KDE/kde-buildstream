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
  url: libzip:download/libzip-{version}.tar.xz
  ref:
    version: 1.12.1
    sha256sum: c40062022a1963c80573d48f6070792297cecd7c6bffe3aefcac0d8b9bee8913
