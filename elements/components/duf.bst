# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/duf/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: Disk Usage/Free Utility

build-depends:
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands:
  - go build -buildmode=pie -trimpath -mod=vendor -o duf .
  install-commands:
  - install -Dm755 duf "%{install-root}%{bindir}/duf"

sources:
- kind: git_repo
  url: github:muesli/duf.git
  track: v*
  ref: v0.9.1-0-gb2f01a1ecbfd1af63015b83296c50a95260f97b1
- kind: go_module
  url: github:IGLOU-EU/go-wildcard.git
  module: github.com/IGLOU-EU/go-wildcard
  ref:
    go-version: v1.0.3
    git-ref: v1.0.3-0-g5269b048c3023f5e5e10500274aebaa20b3c312b
    explicit: True
- kind: go_module
  url: github:aymanbagabas/go-osc52.git
  module: github.com/aymanbagabas/go-osc52/v2
  ref:
    go-version: v2.0.1
    git-ref: v2.0.1-0-gce73587a0f72cf077e55f163e71ea1b5496a133c
    explicit: True
- kind: go_module
  url: github:jedib0t/go-pretty.git
  module: github.com/jedib0t/go-pretty/v6
  ref:
    go-version: v6.6.8
    git-ref: v6.6.8-0-g3c86af826bbe2883c693e0ff28b0fdd4fc3a9846
    explicit: True
- kind: go_module
  url: github:lucasb-eyer/go-colorful.git
  module: github.com/lucasb-eyer/go-colorful
  ref:
    go-version: v1.2.0
    git-ref: v1.2.0-0-gd2b05a0d83cca9d610425691c3253d5f36d0ad06
    explicit: True
- kind: go_module
  url: github:mattn/go-isatty.git
  module: github.com/mattn/go-isatty
  ref:
    go-version: v0.0.20
    git-ref: v0.0.20-0-ga7c02353c47bc4ec6b30dc9628154ae4fe760c11
    explicit: True
- kind: go_module
  url: github:mattn/go-runewidth.git
  module: github.com/mattn/go-runewidth
  ref:
    go-version: v0.0.16
    git-ref: v0.0.16-0-g6ceadc68530e7bfea8cba17d6523bed32912d4fa
    explicit: True
- kind: go_module
  url: github:muesli/mango.git
  module: github.com/muesli/mango
  ref:
    go-version: v0.2.0
    git-ref: v0.2.0-0-g50407234dce52e233c96b748504890cf11d2706d
    explicit: True
- kind: go_module
  url: github:muesli/roff.git
  module: github.com/muesli/roff
  ref:
    go-version: v0.1.0
    git-ref: v0.1.0-0-g273d76dfb27f763ed9a86826be7c55520d46672b
    explicit: True
- kind: go_module
  url: github:muesli/termenv.git
  module: github.com/muesli/termenv
  ref:
    go-version: v0.16.0
    git-ref: v0.16.0-0-g2e6fa35162bb1c735367736319813b2dc01a77a4
    explicit: True
- kind: go_module
  url: github:rivo/uniseg.git
  module: github.com/rivo/uniseg
  ref:
    go-version: v0.4.7
    git-ref: v0.4.7-0-g03509a98a092b522b2ff0de13e53513d18b3b837
    explicit: True
- kind: go_module
  url: github:golang/sys.git
  module: golang.org/x/sys
  ref:
    go-version: v0.35.0
    git-ref: v0.35.0-0-g5b936e1f126baa13682eff91c2e4d5d9e3a0b71d
    explicit: True
- kind: go_module
  url: github:golang/term.git
  module: golang.org/x/term
  ref:
    go-version: v0.34.0
    git-ref: v0.34.0-0-ga35244d18d7756b12deca31a518c0fa1327d050a
    explicit: True
- kind: go_module
  url: github:golang/text.git
  module: golang.org/x/text
  ref:
    go-version: v0.22.0
    git-ref: v0.22.0-0-g3b64043c9e8fa8cd61a019df17dc729630915fa9
    explicit: True
