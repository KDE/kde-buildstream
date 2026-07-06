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
- kind: tar
  url: pypi:source/l/license-expression/license_expression-30.4.4.tar.gz
  ref: 73448f0aacd8d0808895bdc4b2c8e01a8d67646e4188f887375398c761f340fd
