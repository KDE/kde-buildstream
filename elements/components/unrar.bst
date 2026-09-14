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
    version: 7.3.1
    sha256sum: 634900842a3737d9cc15bbcc71d4c74cc713437e0bca296a573424fe5f2660ab
