# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: pip

build-depends:
- freedesktop-sdk.bst:components/python3-pip.bst
- freedesktop-sdk.bst:components/python3-setuptools.bst
- freedesktop-sdk.bst:bootstrap/stripper.bst
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/python3-certifi.bst
- freedesktop-sdk.bst:components/python3-urllib3.bst

variables:
  pip-flags: >-
    pip install
    --no-deps
    --no-index
    --no-build-isolation
    --root="%{install-root}"
    --prefix="%{prefix}"

sources:
- kind: git_repo
  url: github:getsentry/sentry-python.git
  track: '*'
  exclude:
  - '*rc*'
  - '*beta*'
  ref: 3.0.0b4-0-g03e558f407fe94973eea685d2c6ab09c99df7e1c
