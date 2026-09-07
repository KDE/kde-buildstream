# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/jxrlib/-/raw/main/PKGBUILD?ref_type=heads
kind: make

description: Open source implementation of jpegxr

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/python3.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  make-install-args: DIR_INSTALL=%{install-root}/usr/lib/jxrlib %{make-args} install

sources:
- kind: git_repo
  url: github:mircomir/jxrlib
  track: '*'
  exclude:
  - '*rc*'
  - '*beta*'
  ref: 1.4.3-RC1-0-g16db741dff5986a8f66ce6c9409937b70feb0730
