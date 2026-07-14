# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:sdk.bst

sources:
- kind: git_repo
  url: github:dmtx/libdmtx.git
  track: 'v*'
  ref: v0.7.8-0-g500d7af6106713610a0f8b2d96aefa81912b96bc
