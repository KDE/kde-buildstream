# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction_override
element-path: elements/core-deps/xdg-desktop-portal-gtk.bst

variables:
  meson-local: >-
    -Dwallpaper=disabled
