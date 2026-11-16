# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by Arch Linux's PKGBUILD:
# https://gitlab.archlinux.org/archlinux/packaging/packages/sshfs/-/raw/main/PKGBUILD?ref_type=heads
kind: meson

description: FUSE client based on the SSH File Transfer Protocol

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/python3-docutils.bst # rst2man for sshfs.1

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/fuse3.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/openssh.bst # sshfs execs the ssh client

sources:
- kind: git_repo
  url: github:libfuse/sshfs.git
  track: 'sshfs-*'
  ref: sshfs-3.7.7-0-gab648e583fe6490f910ec37414408a01fc772227
