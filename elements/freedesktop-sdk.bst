# SPDX-FileCopyrightText: 2025 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/26.08
  ref: freedesktop-sdk-26.08.4-323-g783dba2ba10b80d33897f12ff617b65252d2930f
- kind: local
  path: files/linux/kde-linux.config
  directory: files/linux
- kind: local
  path: files/freedesktop-sdk/elements/components/_private/dos2unix.bst
  directory: elements/components/_private
- kind: local
  path: files/freedesktop-sdk/files/shim/sbat.kde-linux.csv
  directory: files/shim
- kind: element_overlay
  element: elements/components/linux.bst
  extra-config: files/element-overlays/linux.yml
- kind: element_overlay
  element: elements/components/_private/fwupd-efi.bst
  extra-config: files/element-overlays/fwupd-efi.yml
- kind: element_overlay
  element: elements/components/_private/shim.bst
  extra-config: files/element-overlays/shim.yml

- kind: element_overlay
  element: elements/components/appstream.bst
  extra-config: files/element-overlays/appstream.yml
  dependency-slots:
  - elements/downstream/qtbase.bst

config:
  overrides:
    components/_private/systemd-base.bst: components/systemd-base.bst
    components/at-spi2-core.bst: components/at-spi2-core.bst
    downstream/qtbase.bst: qt/qtbase.bst

  options:
    target_arch: '%{arch}'
    (?):
    - arch in ('x86_64', 'i686'):
        bootstrap_build_arch: 'x86_64'
    - arch in ('aarch64', 'arm'):
        bootstrap_build_arch: 'aarch64'
    - arch == "riscv64":
        bootstrap_build_arch: "x86_64"
