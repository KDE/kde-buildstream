# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: pyproject

description: Linux /proc abstraction classes for Python

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: kernel:pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git
  track: 'v*'
  ref: v0.7.4-0-g702d6360ce082d8328e0cfd84f6415b0c94ca6dd
