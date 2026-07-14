# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: pip

build-depends:
- freedesktop-sdk.bst:components/python3-pip.bst
- freedesktop-sdk.bst:components/python3-setuptools.bst
- freedesktop-sdk.bst:bootstrap/stripper.bst

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
  ref: 3.0.0a7-0-g7d96f392ae6738505b6f605bf72fc3d7b406a111
