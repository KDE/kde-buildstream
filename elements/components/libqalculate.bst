# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: Multi-purpose desktop calculator

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/git.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/readline.bst
- freedesktop-sdk.bst:components/mpfr.bst
- freedesktop-sdk.bst:components/icu.bst
- freedesktop-sdk.bst:components/libxml2.bst

sources:
- kind: git_repo
  url: github:Qalculate/libqalculate
  track: 'v*'
  ref: v5.13.2-0-gd3672af9cf6e05a39bd4206b7b7d6b1e0d194caa
