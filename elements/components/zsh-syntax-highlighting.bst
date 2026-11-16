# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: make

description: Fish shell-like syntax highlighting for zsh

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- components/zsh.bst

variables:
  strip-binaries: ''
  make-args: >-
    PREFIX="%{prefix}"
    SHARE_DIR="%{install-root}%{datadir}/zsh/plugins/zsh-syntax-highlighting"

sources:
- kind: git_repo
  url: github:zsh-users/zsh-syntax-highlighting.git
  track: '*'
  ref: 0.8.0-0-gdb085e4661f6aafd24e5acb5b2e17e4dd5dddf3e
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  - '*pre*'
