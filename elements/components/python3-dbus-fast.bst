# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-poetry.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

environment:
  SKIP_CYTHON: '1'

sources:
- kind: tar
  url: https://files.pythonhosted.org/packages/aa/db/b621610e50b1bc46ff63534d75239553c1bf33256de6096b58214fd9808a/dbus_fast-5.0.22.tar.gz
  ref: 34dc67d7d21a12399828dd13e63b352750580beea54ea7c729e708f2d2905fef
- kind: patch # remove once dbus-fast accepts Cython 3.4.0
  path: patches/python3-dbus-fast/remove-cython-build-requirement.patch
