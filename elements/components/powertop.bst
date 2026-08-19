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
  ref: v2.16-0-g6147262e506c607036eaca4182ee491b61d06aa3
