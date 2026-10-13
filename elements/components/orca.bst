# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/orca/-/raw/main/PKGBUILD?ref_type=heads
kind: meson

description: Screen reader for individuals who are blind or visually impaired

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/at-spi2-core.bst
- freedesktop-sdk.bst:components/gtk3.bst
- freedesktop-sdk.bst:components/pygobject.bst
- freedesktop-sdk.bst:components/itstool.bst
- freedesktop-sdk-extra.bst:components/speech-dispatcher.bst
- components/python-dasbus.bst
- components/sonic.bst

sources:
- kind: git_repo
  url: https://gitlab.gnome.org/GNOME/orca.git
  track: '*[02468].*'
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha*'
  ref: 50.3-0-g911b5c87b643bdc575776dd5f33c4d2e1dab7734
