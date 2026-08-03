# SPDX-FileCopyrightText: 2025 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction

sources:
- kind: git_repo
  url: https://gitlab.com/freedesktop-sdk/freedesktop-sdk.git
  track: master # we need to track master because we bring dependencies from there
  ref: freedesktop-sdk-26.08beta.1-27-g71e7606393d0881011b6bf20fdf3bf7808054150
- kind: local
  path: files/linux/kde-linux.config
  directory: files/linux
- kind: local
  path: files/freedesktop-sdk/elements/components/_private/dos2unix.bst
  directory: elements/components/_private
- kind: local
  path: files/freedesktop-sdk/files/shim/sbat.kde-linux.csv
  directory: files/shim
- kind: junction_override
  path: elements/junction-overrides/systemd.bst
- kind: junction_override
  path: elements/junction-overrides/linux.bst
- kind: junction_override
  path: elements/junction-overrides/fwupd-efi.bst
- kind: junction_override
  path: elements/junction-overrides/shim.bst

config:
  options:
    target_arch: '%{arch}'
    (?):
    - arch in ('x86_64', 'i686'):
        bootstrap_build_arch: 'x86_64'
    - arch in ('aarch64', 'arm'):
        bootstrap_build_arch: 'aarch64'
    - arch == "riscv64":
        bootstrap_build_arch: "x86_64"
