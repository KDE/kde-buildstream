# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by Arch Linux's PKGBUILD:
# https://gitlab.archlinux.org/archlinux/packaging/packages/socat/-/raw/main/PKGBUILD?ref_type=heads
kind: autotools

description: Multipurpose relay for bidirectional data transfer

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/readline.bst
- freedesktop-sdk.bst:components/openssl.bst

sources:
- kind: tar
  url: http://www.dest-unreach.org/socat/download/socat-1.8.1.3.tar.gz
  ref: 06602ffd591e98c75b3dc1d66f0f19136cc666b0b2d95caad987d6ab2cb28097
