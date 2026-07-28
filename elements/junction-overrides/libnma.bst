# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction_override
element-path: elements/core-deps/libnma.bst

variables:
  meson-local: >-
    -Dlibnma_gtk4=true
    -Dvapi=false
