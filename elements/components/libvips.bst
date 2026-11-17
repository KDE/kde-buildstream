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
# image formats, appstream compose needs at least png
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/jpeg.bst
- freedesktop-sdk.bst:components/lcms.bst
- freedesktop-sdk.bst:components/libarchive.bst
- freedesktop-sdk.bst:components/libpng.bst
- freedesktop-sdk.bst:components/libtiff.bst
- freedesktop-sdk.bst:components/libwebp.bst
- freedesktop-sdk.bst:components/openjpeg.bst
- freedesktop-sdk.bst:components/pango.bst
- components/libRaw.bst
- components/openexr.bst

sources:
- kind: git_repo
  url: github:libvips/libvips
  track: 'v*'
  ref: v8.19.0-rc1-0-g115df84b47247fb3d644de16bbb997f9edc4b5e3
