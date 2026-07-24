# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

description: Fish shell-like syntax highlighting for zsh

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- components/zsh.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 zsh-syntax-highlighting.zsh "%{install-root}%{datadir}/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  - cp -a highlighters "%{install-root}%{datadir}/zsh/plugins/zsh-syntax-highlighting/"

sources:
- kind: git_repo
  url: github:zsh-users/zsh-syntax-highlighting.git
  track: '*'
  ref: 0.8.0-alpha1-pre-redrawhook-0-g00a5fd11eb9d1c163fb49da5310c8f4b09fb3022
