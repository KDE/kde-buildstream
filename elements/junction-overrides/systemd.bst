# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction_override
element-path: elements/components/_private/systemd-base.bst

variables:
  meson-local: >-
    %{original}
    -Dfallback-hostname='kde-linux'
    -Dsbat-distro=kde-linux
    -Dsbat-distro-summary="KDE Linux"
    -Dsbat-distro-url=https://linux.kde.org
