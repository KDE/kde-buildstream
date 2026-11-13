# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: Desktop Management Interface table related utilities

kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    sbindir="%{prefix}/bin"

sources:
- kind: anitya
  project-id: 443
  url: https://download.savannah.gnu.org/releases/dmidecode/dmidecode-{version}.tar.xz
  ref:
    version: '3.7'
    sha256sum: 2c3aed12c85a1e6a9410d406d5e417c455466dc1bc7c89278bb32cf7cad91e8a
