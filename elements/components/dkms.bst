# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

description: yaml-cpp C++ YAML parser and emitter library

sources:
- kind: git_repo
  url: github:dkms-project/dkms.git
  ref: v3.4.4-0-gcb2790f3d900598d5e55865540f45a049a696e66
  track: main

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands:
  - ls
  install-commands:
  - make install DESTDIR="%{install-root}" SBIN=/usr/bin MODDIR=/usr/lib/modules
