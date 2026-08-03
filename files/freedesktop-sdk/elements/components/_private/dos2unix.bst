# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

description: DOS/Mac to Unix and vice versa text file format converter

build-depends:
- components/gettext.bst
- components/po4a.bst
- components/perl-pod-parser.bst
- public-stacks/buildsystem-make.bst

variables:
  command-subdir: "%{build-root}/dos2unix"

sources:
- kind: git_repo
  url: sourceforge_git:dos2unix/dos2unix.git
  track: "dos2unix-*"
  ref: dos2unix-7.5.6-0-g9c2ea173af3bc49324f8288d81c5a2bbfc0884d0
