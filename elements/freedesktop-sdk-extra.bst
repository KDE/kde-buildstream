# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>

kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk-extra.git
  track: main
  ref: 5be95c44a071953f9588da349045cb3409f2bdf3

config:
  options:
    arch: '%{arch}'
  overrides:
    plugins/buildstream-plugins-community.bst: plugins/buildstream-plugins-community.bst
    freedesktop-sdk.bst: freedesktop-sdk.bst
