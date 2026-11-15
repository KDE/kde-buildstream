# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: A fast image processing library with low memory needs

kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/expat.bst
- freedesktop-sdk.bst:components/glib.bst

sources:
- kind: git_repo
  url: github:libvips/libvips
  track: 'v*'
  ref: v8.18.7-0-g24ad4d042940e6bf99a68871ba886ca8847c9c82
