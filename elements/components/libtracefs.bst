# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: meson

description: Linux kernel trace file system library

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:bootstrap/gawk.bst
- freedesktop-sdk.bst:components/flex.bst
- freedesktop-sdk.bst:components/bison.bst
- freedesktop-sdk.bst:components/sed.bst
- freedesktop-sdk.bst:components/asciidoc.bst
- freedesktop-sdk.bst:components/xmlto.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libtraceevent.bst

sources:
- kind: git_repo
  url: kernel:pub/scm/libs/libtrace/libtracefs.git
  track: 'libtracefs-*'
  ref: libtracefs-1.8.3-0-g74b0e2db1b90e2e9450d11016bc515c4b11a5d51
