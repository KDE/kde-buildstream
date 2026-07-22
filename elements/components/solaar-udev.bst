# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

description: Udev rules for Logitech receivers

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pwr-Solaar/Solaar.git
  track: '*'

  ref: 1.1.20-0-gb2afd88129533997eb3112fe9b8e75e6d9e2b1b4
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha*'

config:
  install-commands:
  - |
    install -Dm644 rules.d-uinput/42-logitech-unify-permissions.rules \
      "%{install-root}%{prefix}/lib/udev/rules.d/42-logitech-unify-permissions.rules"
