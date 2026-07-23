# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by Arch Linux's PKGBUILD:
# https://gitlab.archlinux.org/archlinux/packaging/packages/socat/-/raw/main/PKGBUILD?ref_type=heads
kind: autotools

description: Multipurpose relay for bidirectional data transfer

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- components/yodl.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/readline.bst
- freedesktop-sdk.bst:components/openssl.bst

sources:
- kind: git_repo
  # url: https://repo.or.cz/socat.git
  url: https://third-party-mirror.googlesource.com/socat
  track: tag-*
  exclude:
  - "*-b[0-9]*"
  ref: tag-1.8.1.3-0-g12c08bf66d709fba17035ce95d85bd218428d9ba
