# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/yubikey-manager/-/raw/main/PKGBUILD?ref_type=heads
kind: pyproject

description: Python library and command line tool for configuring a YubiKey

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-poetry.bst
- freedesktop-sdk.bst:components/stripper.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: anitya
  project-id: 67946
  url: 'github:Yubico/yubikey-manager/releases/download/{version}/yubikey_manager-{version}.tar.gz'
  ref:
    version: 5.9.2
    sha256sum: 9584c7377449e6487140da6c3f13a289e618b0023c8414be91c1c212fce3c473
