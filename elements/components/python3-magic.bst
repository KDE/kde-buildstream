# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: pyproject

description: Python interface to libmagic

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/file.bst
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:ahupp/python-magic.git
  track: '*'
  ref: 0.4.27-0-gb443195104d89363b93a547584c1a12fce3b57ec
