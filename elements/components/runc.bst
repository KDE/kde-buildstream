# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: CLI tool for managing OCI compliant containers

kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/git.bst
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:components/pkg-config.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libseccomp.bst
- components/libpathrs.bst

variables:
  make-install: make -j1 BINDIR=%{prefix}/bin %{make-install-args}

sources:
- kind: git_repo
  url: github:opencontainers/runc.git
  track: "v*"
  exclude:
  - "*rc*"
  ref: v1.5.1-0-g8f2685a471d3347a686ad3909783d8aafc6bb208
