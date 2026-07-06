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
  ref: v2.15-0-gd51ad395436d4d1dcc3ca46e1519ffeb475bf651
