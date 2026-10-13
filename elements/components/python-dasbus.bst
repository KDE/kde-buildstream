# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: pyproject

description: Python D-Bus library based on GLib

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/pygobject.bst

sources:
- kind: git_repo
  url: github:dasbus-project/dasbus.git
  track: 'v*'
  ref: v1.7-0-g413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5
