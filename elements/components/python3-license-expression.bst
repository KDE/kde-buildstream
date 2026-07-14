# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: pyproject

description: Utility library to parse, compare and normalize license expressions

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- freedesktop-sdk.bst:components/python3-setuptools-scm.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst
- components/python3-boolean.py.bst

sources:
- kind: git_repo
  url: github:aboutcode-org/license-expression.git
  track: 'v*'
  ref: v30.4.4-0-ga3c00c09986bcca1240afd5b1844b56de3f581c1
