# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: pyproject

description: Linux /proc abstraction classes for Python

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: tar
  url: https://www.kernel.org/pub/software/libs/python/python-linux-procfs/python-linux-procfs-0.7.4.tar.xz
  ref: 3a15e97b5e19279978e9aab5567416d76b8101f2cc82f95aca0f6f2dade4fbd7
