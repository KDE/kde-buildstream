# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: meson

description: PowerTOP

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/sed.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/ncurses.bst
- freedesktop-sdk.bst:components/libnl.bst
- freedesktop-sdk.bst:components/pciutils.bst
- components/libtracefs.bst

sources:
- kind: git_repo
  url: github:fenrus75/powertop.git
  track: 'v[0-9]*'
  exclude:
  - '*rc*'
  - '*pre*'
  - '*internal*'
  ref: v2.16.1-0-g11db5648c9fdea97d36ce6a11ef282e4e037aa92
