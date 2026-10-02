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
  ref: ef2365d0f9f1a370d721a82470d69c3646fe97f0
  ref-format: sha1
