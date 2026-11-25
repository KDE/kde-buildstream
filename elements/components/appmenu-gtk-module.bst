# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/appmenu-gtk-module/-/raw/main/PKGBUILD?ref_type=heads
kind: meson

description: Application Menu GTK Module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/vala.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst

depends:
- components/appmenu-glib-translator.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/gtk3.bst
- freedesktop-sdk.bst:components/wayland.bst

variables:
  command-subdir: subprojects/appmenu-gtk-module
  meson-local: >-
    -Dgtk=3

sources:
- kind: git_repo
  url: gitlab:vala-panel-project/vala-panel-appmenu
  track: '*'
  ref: 26.11.1-0-g427807ddd8a0c9594a7a4ffbe279d544911ce3bb
