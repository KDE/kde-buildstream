# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: meson

sources:
- kind: git_repo
  url: gnome:libnma.git
  track: main
  ref: 1.10.7-dev-47-g513be68b39c3db3b16f4432c1e55ed9f7aa9e5a4

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/gtk-doc.bst
- freedesktop-sdk.bst:components/vala.bst

depends:
- freedesktop-sdk.bst:components/networkmanager.bst
- freedesktop-sdk-extra.bst:components/mobile-broadband-provider-info.bst
- freedesktop-sdk-extra.bst:components/gcr.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/gtk3.bst
- freedesktop-sdk.bst:components/iso-codes.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Dlibnma_gtk4=false
    -Dvapi=false
