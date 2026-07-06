# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/reuse/-/raw/main/PKGBUILD?ref_type=heads
kind: pyproject

description: Helper tool for providing and confirming copyright and licensing information

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/python3-attrs.bst
- freedesktop-sdk.bst:components/python3-click.bst
- freedesktop-sdk.bst:components/python3-jinja2.bst
- freedesktop-sdk.bst:components/python3-tomlkit.bst
- components/python3-debian.bst
- components/python3-license-expression.bst
- components/python3-magic.bst

sources:
- kind: git_repo
  url: github:fsfe/reuse-tool
  track: 'v*'
  ref: v6.2.0-0-ga1bb792acda6fd0724936b4ebbdbc8eceb9c0459
