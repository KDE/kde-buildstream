# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction_override
element-path: elements/components/_private/fwupd-efi.bst

variables:
  meson-local: >-
    %{original}
    -Defi_sbat_distro_id="kde-linux"
    -Defi_sbat_distro_summary="KDE Linux"
    -Defi_sbat_distro_url="https://linux.kde.org"
