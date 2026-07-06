# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: pyproject

description: Modules to read and manipulate Debian package formats

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- freedesktop-sdk.bst:components/python3-setuptools-scm.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: tar
  url: pypi:source/p/python-debian/python_debian-1.1.1.tar.gz
  ref: fe4fc3dc798dbf1f0ef5865e2b1b4f7cc0352b6a511b25ab7594906c64a73629
