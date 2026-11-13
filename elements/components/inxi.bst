# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: Full featured CLI system information tool

kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  install-commands:
  - install -Dm 00755 inxi "%{install-root}%{bindir}/inxi"

sources:
- kind: anitya
  project-id: 10526
  url: 'codeberg:smxi/inxi/archive/{version}.tar.gz'
  ref:
    version: 3.3.41-1
    sha256sum: e08d92550a0f10890e722cc7db1e6d6cbde7e9fb47e61a8c6cec51f54a0b63d8

