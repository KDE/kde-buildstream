# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: make

sources:
- kind: git_repo
  url: sipsolutions:iw.git
  track: 'v*'
  ref: v6.17-0-ga52bda09d7d314f4d4ed333a0c5da51bfbaeafaf

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/gzip.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libnl.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    SBINDIR="%{sbindir}"
