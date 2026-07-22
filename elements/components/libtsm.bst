# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst

variables:
  meson-local: >-
    -Dtests=false
    -Dgtktsm=false

sources:
- kind: git_repo
  url: github:kmscon/libtsm.git
  track: v*
  ref: e1e4d296f0963d1641456f1f778f0ac090429a3e
  ref-format: sha1
