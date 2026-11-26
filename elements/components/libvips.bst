# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: A fast image processing library with low memory needs

kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/gobject-introspection.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/expat.bst
- freedesktop-sdk.bst:components/glib.bst
# image formats, appstream compose needs at least png
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/fftw.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/highway.bst
- freedesktop-sdk.bst:components/jpeg.bst
- freedesktop-sdk.bst:components/lcms.bst
- freedesktop-sdk.bst:components/libarchive.bst
- freedesktop-sdk.bst:components/libexif.bst
- freedesktop-sdk.bst:components/libheif.bst
- freedesktop-sdk.bst:components/libjxl.bst
- freedesktop-sdk.bst:components/libpng.bst
- freedesktop-sdk.bst:components/librsvg.bst
- freedesktop-sdk.bst:components/libtiff.bst
- freedesktop-sdk.bst:components/libwebp.bst
- freedesktop-sdk.bst:components/openjpeg.bst
- freedesktop-sdk.bst:components/orc.bst
- freedesktop-sdk.bst:components/pango.bst
- freedesktop-sdk.bst:components/poppler.bst
- components/libRaw.bst
- components/openexr.bst

sources:
- kind: git_repo
  url: github:libvips/libvips
  track: 'v*'
  ref: v8.19.0-rc2-0-g2801ef3d504f2ef42a5100adc20e8502e9777be1
