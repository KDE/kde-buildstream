# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: Simple library to speed up or slow down speech

kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:waywardgeek/sonic.git
  track: release-0.2.0
  ref: release-0.2.0-0-g60eeb064f62a106069d2ce148fabd724f9df9780
