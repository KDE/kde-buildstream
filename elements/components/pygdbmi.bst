# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: pip

sources:
- kind: git_repo
  url: github:cs01/pygdbmi.git
  track: "*"
  ref: 0.10.0.0-0-g23358b9bf6b4957eaac70b579b6858fa4395538a
build-depends:
- freedesktop-sdk.bst:components/python3-setuptools.bst
- freedesktop-sdk.bst:components/python3-pip.bst
- freedesktop-sdk.bst:bootstrap/stripper.bst


depends:
- freedesktop-sdk.bst:components/python3.bst

variables:
  pip-flags: >-
    pip install
    --no-deps
    --no-index
    --no-build-isolation
    --root="%{install-root}"
    --prefix="%{prefix}"
