# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction_override
element-path: elements/components/linux.bst

environment:
  ZSTD_CLEVEL: '19'
  INSTALL_MOD_STRIP: '1'

config:
  configure-commands:
    (>):
    - scripts/kconfig/merge_config.sh -m .config kde-linux.config
    - make -j1 olddefconfig

  strip-commands:
    (>):
    - make -j1 INSTALL_MOD_PATH="%{install-root}%{prefix}" vdso_install

sources:
  (>):
  - kind: local
    path: files/linux/kde-linux.config
