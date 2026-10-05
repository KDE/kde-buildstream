# SPDX-FileCopyrightText: 2025 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/26.08
  ref: freedesktop-sdk-26.08.2-26-gb8134f807c374c5ec7d7b51c8a0fe7fbdb2de7a2
- kind: patch_queue
  path: patches/freedesktop-sdk

config:
  overrides:
    components/extra-cmake-modules.bst: kde/extra-cmake-modules.bst
    components/appstream.bst: components/appstreamqt.bst
  options:
    target_arch: '%{arch}'
    (?):
    - arch in ('x86_64', 'i686'):
        bootstrap_build_arch: 'x86_64'
    - arch in ('aarch64', 'arm'):
        bootstrap_build_arch: 'aarch64'
    - arch == "riscv64":
        bootstrap_build_arch: "x86_64"
