# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: PowerTOP

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/ncurses.bst
- freedesktop-sdk.bst:components/libnl.bst
- freedesktop-sdk.bst:components/pciutils.bst

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

sources:
- kind: git_repo
  url: github:fenrus75/powertop.git
  track: 'v[0-9]*'
  exclude:
  - '*rc*'
  - '*pre*'
  - '*internal*'
  ref: v2.16-0-g6147262e506c607036eaca4182ee491b61d06aa3
