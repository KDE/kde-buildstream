# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/freetype.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/libglvnd.bst
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/pango.bst

depends:
- components/libtsm.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/libdrm.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:components/zlib.bst
- freedesktop-sdk.bst:components/freetype.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/libglvnd.bst
- freedesktop-sdk.bst:components/pango.bst

variables:
  meson-local: >-
    -Dtests=false
    -Drenderer_gltex=disabled
    -Dvideo_drm3d=disabled

sources:
- kind: git_repo
  url: https://github.com/kmscon/kmscon.git
  track: v*
  ref: 629568eaae15c1e4a5c5a1ecdea00cd785f3a210
  ref-format: sha1
