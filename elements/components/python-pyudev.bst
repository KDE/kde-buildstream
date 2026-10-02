# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/python-pyudev/-/raw/main/PKGBUILD?ref_type=heads

kind: pyproject

description: Python bindings to libudev

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:pyudev/pyudev.git
  track: 'v*'
  ref: v0.24.5-0-g65f292d491ea9e3edbb372365b8ed098b1735214
