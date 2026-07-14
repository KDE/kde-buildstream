# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: make

description: A directory listing program displaying a depth indented list of 
  files

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  make-install: make PREFIX="%{install-root}%{prefix}" 
    MANDIR="%{install-root}%{mandir}" install

sources:
- kind: git_repo
  url: gitlab:OldManProgrammer/unix-tree.git
  track: '*'
  ref: 2.3.2-0-g1a41b51bea1cec4109eb9f726370449b384b4576
