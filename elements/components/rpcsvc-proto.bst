# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: anitya
  project-id: 155452
  url: 'github:thkukuk/rpcsvc-proto/releases/download/v{version}/rpcsvc-proto-{version}.tar.xz'
  ref:
    version: 1.4.4
    sha256sum: 81c3aa27edb5d8a18ef027081ebb984234d5b5860c65bd99d4ac8f03145a558b
