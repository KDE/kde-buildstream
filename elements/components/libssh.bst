# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: anitya
  project-id: 1729
  url: 'https://www.libssh.org/files/{major}.{minor}/libssh-{version}.tar.xz'
  ref:
    version: 0.12.2
    sha256sum: 49560f677d96e3706a904ac2de1116e25f3680937d51e5c92198fcba4a1c1e9f
