# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: High-level API for encoding Opus files

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/libogg.bst
- freedesktop-sdk.bst:components/opus.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libogg.bst
- freedesktop-sdk.bst:components/opus.bst

sources:
- kind: anitya
  project-id: 17877
  url: 'https://downloads.xiph.org/releases/opus/libopusenc-{version}.tar.gz'
  ref:
    version: '0.3'
    sha256sum: f616d3aff9b2034547894ccb8ab56c36cf1a4acb0d922c5d7119f97bbe58642c
