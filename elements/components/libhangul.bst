# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-local: --disable-static

sources:
- kind: git_repo
  url: github:libhangul/libhangul.git
  track: 'libhangul-*'
  ref: libhangul-0.2.0-0-g41c702f5d3581325b646ef6249f1f641b0427ae0
