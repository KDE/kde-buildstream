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
  ref: v5.12.0-0-gd01cfdae6f965bf9264af3b52db8f5b0345fe1da
