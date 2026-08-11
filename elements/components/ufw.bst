# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/ufw/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: Uncomplicated and easy to use CLI tool for managing a netfilter firewall

build-depends:
- freedesktop-sdk.bst:components/gettext.bst
- freedesktop-sdk.bst:components/python3-setuptools.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/iptables.bst
- freedesktop-sdk.bst:components/python3.bst

config:
  build-commands:
  - make mo
  install-commands:
  - python3 setup.py install --root="%{install-root}" --prefix="%{prefix}"

sources:
- kind: git_repo
  url: https://git.launchpad.net/ufw
  track: '*'
  exclude:
  - '*rc*'
  - '*pre*'
  ref: 0.36.2-0-g2ed44c38ea83e86af99ee51abc2bf9393c07a39a
