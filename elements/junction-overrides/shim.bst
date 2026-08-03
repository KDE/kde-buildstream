# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction_override
element-path: elements/components/_private/shim.bst

build-depends:
  (>):
  - components/_private/dos2unix.bst

variables:
  make-args: >-
    %{original}
    EFIDIR=kde-linux

sources:
  (>):
  - kind: local
    path: files/shim/sbat.kde-linux.csv
    directory: data/
