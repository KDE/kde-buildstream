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
  # overriding BINDIR so it doesn't create a directory for sbin, which we want
  # to be a symlink instead.
  make-install: make -j1 BINDIR=%{prefix}/bin %{make-install-args}

sources:
- kind: git_repo
  url: github:opencontainers/runc.git
  track: "v*"
  exclude:
  - "*rc*"
  ref: v1.5.2-0-g29dd3dc2b13b4123162e5fe132504bb4b15569f1
