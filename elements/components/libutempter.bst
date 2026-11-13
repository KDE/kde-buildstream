# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: Interface for terminal emulators to record user sessions to utmp and wtmp files

kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  make-args: -C libutempter libdir=%{libdir} libexecdir=%{prefix}/lib includedir=%{includedir} mandir=%{mandir}

config:
  install-commands:
  - "%{make-install}"
  - install -Dm644 libutempter.tmpfiles "%{install-root}%{prefix}/lib/tmpfiles.d/libutempter.conf"

sources:
- kind: git_repo
  url: github:altlinux/libutempter.git
  track: '*-alt*'
  ref: 1.2.3-alt1-0-g4caa8ab94ff8b207228fa723a89214bf5e929321
- kind: remote
  filename: libutempter.tmpfiles
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/libutempter/-/raw/main/libutempter.tmpfiles?ref_type=heads
  ref: 8fc708052bab79f707bacaa66fa1529808bc7e72316faf4038ad9c763ec7e80d
