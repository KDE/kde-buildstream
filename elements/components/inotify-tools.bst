# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: inotify-tools is a C library and a set of command-line programs for Linux providing a simple interface to inotify.

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/doxygen.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-local: --enable-fanotify

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

sources:
- kind: git_repo
  url: github:inotify-tools/inotify-tools.git
  track: '*'
  ref: 4.26.262-0-ga97ac7e22cfb44866b66450baaefbad8114f3e8d
