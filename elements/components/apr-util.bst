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
    version: 1.6.6
    sha256sum: aa77dd25f036731b7246abbfbebe6cc813b42799b62c874bc82bd4e1f90f2918
