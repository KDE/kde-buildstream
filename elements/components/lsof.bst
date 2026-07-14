# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: Lists open files for running Unix processes

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/groff.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libtirpc.bst

variables:
  conf-local: >-
    --enable-security
    --enable-no-sock-security
    --with-libtirpc

config:
  configure-commands:
    (<):
    - autoreconf -fiv

sources:
- kind: git_repo
  url: github:lsof-org/lsof.git
  track: '*'
  ref: 4.99.7-0-g646395f8e893edb5572405b2311a079f55f269f2
