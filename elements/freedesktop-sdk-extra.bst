# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>

kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk-extra.git
  track: main
  ref: f68ac67b38a4e42c59d7d56f2db2d3662ea9c33b

config:
  options:
    arch: '%{arch}'
  overrides:
    plugins/buildstream-plugins-community.bst: plugins/buildstream-plugins-community.bst
    freedesktop-sdk.bst: freedesktop-sdk.bst
