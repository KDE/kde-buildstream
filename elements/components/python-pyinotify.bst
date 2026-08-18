# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Draft generated from Arch PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/python-pyinotify/-/raw/main/PKGBUILD?ref_type=heads
kind: pyproject

description: Python module used for monitoring filesystems events on Linux platforms with inotify.

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:seb-m/pyinotify.git
  track: '*'
  ref: 0.9.6-0-g2d716e5ceef8ade1a60eff0bac30de939afb2b8d
