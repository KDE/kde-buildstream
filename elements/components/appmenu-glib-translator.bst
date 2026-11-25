# SPDX-FileCopyrightText: 2026 KDE Contributors
# SPDX-License-Identifier: BSD-2-Clause

kind: meson

description: GLib library for translating DBusMenu to GMenuModel

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/vala.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/gdk-pixbuf.bst
- freedesktop-sdk.bst:components/glib.bst

variables:
  command-subdir: subprojects/appmenu-glib-translator

sources:
- kind: git_repo
  url: gitlab:vala-panel-project/vala-panel-appmenu
  track: '*'
  ref: 26.11.1-0-g427807ddd8a0c9594a7a4ffbe279d544911ce3bb
