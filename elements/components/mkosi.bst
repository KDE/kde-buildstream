# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>

kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- freedesktop-sdk.bst:components/python3-setuptools-scm.bst

runtime-depends:
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst
- freedesktop-sdk.bst:components/cpio.bst
- freedesktop-sdk.bst:components/kmod.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/python3-pefile.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/util-linux.bst
- freedesktop-sdk.bst:components/zstd.bst

sources:
- kind: git_repo
  url: github:systemd/mkosi.git
  track: v[0-9]*
  ref: v27.1-0-gecf7f5702bb2052b7a69cab3fe7d37bc3b9ad77b
