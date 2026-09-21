# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/trash-cli/-/raw/main/PKGBUILD?ref_type=heads
kind: pyproject

description: Command line trashcan (recycle bin) interface

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:andreafrancia/trash-cli.git
  track: '*'
  ref: 0.26.9.14-0-g1905f16724e42bb8523147020a05341d8485f3ef
