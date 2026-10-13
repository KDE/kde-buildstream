# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

# Forked from freedesktop-sdk as updating it breaks ABI

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/dbus.bst
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/gtk-doc.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/libdbus.bst

variables:
  meson-local: >-
    -Dx11=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-1.0.so'
        - '%{libdir}/libatk-bridge-2.0.so'
        - '%{libdir}/libatspi.so'

  cpe:
    vendor: 'gnome'

sources:
- kind: git_repo
  url: gnome:at-spi2-core.git
  track: "*.[02468].*"
  ref: 2.62.0.1-0-gb33ff15213c4c09dfc0a5b261875c65c7cffd91d
