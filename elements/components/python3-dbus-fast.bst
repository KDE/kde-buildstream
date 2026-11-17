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
- kind: pypi
  name: dbus-fast
  url: 'pypi:'
  ref:
    sha256sum: a4a5dddc04b1ade5eb7650d791e2f6fb7c1334595593473914e78a2526ecddda
    suffix: 4c/5b/ce64b8788c10a8bd313c8638b28be5dccdd5c2daf14839f23aff37e0b39d/dbus_fast-5.2.0.tar.gz
- kind: patch # remove once dbus-fast accepts Cython 3.4.0
  path: patches/python3-dbus-fast/remove-cython-build-requirement.patch
