# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

description: yaml-cpp C++ YAML parser and emitter library

sources:
- kind: git
  url: github:dkms-project/dkms.git
  ref: 6300d311da96bd4ee1aeb532e172331dcac6e4fd
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
