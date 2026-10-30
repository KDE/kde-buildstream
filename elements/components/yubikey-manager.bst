# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/yubikey-manager/-/raw/main/PKGBUILD?ref_type=heads
kind: pyproject

description: Python library and command line tool for configuring a YubiKey

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-poetry.bst
- freedesktop-sdk.bst:components/stripper.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:Yubico/yubikey-manager.git
  track: '[0-9]*'
  exclude:
  - '*a*'
  - '*b*'
  - '*rc*'
  - '*dev*'
  ref: 5.9.2-0-g60ab055dd34b6384bdd4ceb85a38d36bc15ce58a
