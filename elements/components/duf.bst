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
- kind: go_mod_vendor
  ref:
  - module: github.com/IGLOU-EU/go-wildcard
    version: v1.0.3
    sha256sum: fabf7a28a76606b3aa9c9ef54a0f59cb9b5fdbd9e3dcb40fa55786beebd39416
  - module: github.com/aymanbagabas/go-osc52/v2
    version: v2.0.1
    sha256sum: 939ebf2a5481f2172e1a5e0c318d05aef5b6d950a960556216c3da7879a927f8
  - module: github.com/davecgh/go-spew
    version: v1.1.1
    sha256sum: 6b44a843951f371b7010c754ecc3cabefe815d5ced1c5b9409fb2d697e8a890d
  - module: github.com/jedib0t/go-pretty/v6
    version: v6.6.8
    sha256sum: cb4a3eec0a13d23f986d76e479f9400789fb40844ef0ecd1f2174212dc7aa0e9
  - module: github.com/lucasb-eyer/go-colorful
    version: v1.2.0
    sha256sum: 78d5d0e0737f0f54bbed77b6dfa847d8c871bed2668a9dc44328c7c3411ada10
  - module: github.com/mattn/go-isatty
    version: v0.0.20
    sha256sum: f2d5f89ca451577e17464b9bb596dc0d0ecececb5eaa63622c41b57cd0b7b8cc
  - module: github.com/mattn/go-runewidth
    version: v0.0.16
    sha256sum: 179d2d900c76ee3560fbeda60d0237a3be6acb734d0cb7423b55e5ccb0cedbca
  - module: github.com/muesli/mango
    version: v0.2.0
    sha256sum: a95275afdeaf6ac18526e5574d0814a3425a468849fdbfbfca5893fc775da32d
  - module: github.com/muesli/roff
    version: v0.1.0
    sha256sum: 9fd6265f0207b4af5786049c728c0ed9844b83cab8c0bfe419c49378dc08a173
  - module: github.com/muesli/termenv
    version: v0.16.0
    sha256sum: ba02d3ebd9c1d87e2c2133b1f2bb61a7001b3765196e8016029ce9fe54c5c0fc
  - module: github.com/pmezard/go-difflib
    version: v1.0.0
    sha256sum: de04cecc1a4b8d53e4357051026794bcbc54f2e6a260cfac508ce69d5d6457a0
  - module: github.com/rivo/uniseg
    version: v0.4.7
    sha256sum: b995e4aa0cc1e5779cc61138ac925cb8c1e963e40c80e4b93ee8553812ebb792
  - module: github.com/stretchr/testify
    version: v1.10.0
    sha256sum: 36c87573527a97ce97fc15ce2a101e65e5ebb350db142d09f633580cb8d5c839
  - module: golang.org/x/sys
    version: v0.35.0
    sha256sum: dc3c20611168aaa8fda0d71999be1a5222a0ba57bc767c978a590e41ff2ede35
  - module: golang.org/x/term
    version: v0.34.0
    sha256sum: 22281cbf30560433d57de8d72c1151f9cac2917795dc6e9f694f7a525bb5309c
  - module: golang.org/x/text
    version: v0.22.0
    sha256sum: 939cb4c202aa8fa302f2ba6f9d29165ce82fce9c665d9a1a0bb0d9e51b79e6f5
  - module: gopkg.in/yaml.v3
    version: v3.0.1
    sha256sum: aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015
