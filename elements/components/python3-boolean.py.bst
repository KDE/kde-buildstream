# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: pyproject

description: Boolean algebra library

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: tar
  url: pypi:source/b/boolean.py/boolean_py-5.0.tar.gz
  ref: 60cbc4bad079753721d32649545505362c754e121570ada4658b852a3a318d95
