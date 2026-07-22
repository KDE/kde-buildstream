# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/tldr/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: Command line client for tldr, a collection of simplified man pages.

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:tldr-pages/tldr-python-client.git
  track: '*'
  ref: 3.4.4-0-g548854517e524d027fc903a20aa4d50028106750
