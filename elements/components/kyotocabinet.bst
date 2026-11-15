# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/zlib.bst

variables:
  autogen: autoreconf -fvi
  conf-local: --disable-opt

sources:
- kind: anitya
  project-id: 1530
  url: https://dbmx.net/kyotocabinet/pkg/kyotocabinet-{version}.tar.gz
  ref:
    version: 1.2.80
    sha256sum: 4c85d736668d82920bfdbdb92ac3d66b7db1108f09581a769dd9160a02def349
