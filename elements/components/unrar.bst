# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/unrar/-/raw/main/PKGBUILD?ref_type=heads
kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  make-install: |
    make -j1 %{make-install-args}
    install -Dm755 "%{install-root}/bin/unrar" "%{install-root}%{bindir}/unrar"
    rm -rf "%{install-root}/bin"

sources:
- kind: anitya
  project-id: 13306
  url: 'https://www.rarlab.com/rar/unrarsrc-{version}.tar.gz'
  ref:
    version: 7.2.7
    sha256sum: 01d903a7dcf413cb2925696d7796e48e38d471f79bfe7ef3ad2aebf6c12dbefd
