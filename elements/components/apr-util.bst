# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: Apache Portable Runtime Utility Library

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- components/apr.bst
- freedesktop-sdk.bst:components/expat.bst
- freedesktop-sdk.bst:components/sqlite.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- components/apr.bst

variables:
  conf-local: >-
    --with-apr=/usr/bin/apr-1-config
    --without-berkeley-db
    --without-ldap
    --without-crypto

sources:
- kind: anitya
  project-id: 96
  url: 'https://downloads.apache.org/apr/apr-util-{version}.tar.bz2'
  ref:
    version: 1.6.5
    sha256sum: 96de1dd6f6a0476d2d2e7964926d8c1ddc3bb0e210e1b1812d3ba5a454a392e2
