# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: make

description: inotify-tools is a C library and a set of command-line programs for Linux providing a simple interface to inotify.

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/rust.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:inotify-tools/inotify-tools.git
  track: '*'
  ref: 4.26.262-0-ga97ac7e22cfb44866b66450baaefbad8114f3e8d
- kind: cargo2
  cargo-lock: Cargo.lock
  ref:
  - kind: registry
    name: libc
    version: 0.2.183
    sha: b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d
