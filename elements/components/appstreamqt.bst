# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

# Forked from freedesktop-sdk because we need appstream-qt

kind: meson

sources:
- kind: git_repo
  url: github:ximion/appstream.git
  track: v1.1.*
  ref: v1.1.6-0-gc046aa7e28e1950d44874bc5bdfc2268a338255f

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:bootstrap/sed.bst
- freedesktop-sdk.bst:components/gperf.bst
- freedesktop-sdk.bst:components/itstool.bst

depends:
- freedesktop-sdk.bst:components/bash-completion.bst
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/curl.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/freetype.bst
- freedesktop-sdk.bst:components/gdk-pixbuf.bst
- freedesktop-sdk.bst:components/glib-networking.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/libfyaml.bst
- freedesktop-sdk.bst:components/librsvg.bst
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/libxmlb.bst
- freedesktop-sdk.bst:components/pango.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- qt/qtbase.bst

variables:
  meson-local: >-
    -Dstemming=false
    -Dcompose=true
    -Ddocs=false
    -Dapidocs=false
    -Dman=false
    -Dblake3-support=false
    -Dqt=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libappstream-compose.so'
        - '%{libdir}/libappstream.so'
        - '%{bindir}'
        - '%{bindir}/**'
