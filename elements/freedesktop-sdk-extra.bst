# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>

kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk-extra.git
  track: main
  ref: 3c6f7cdcdd652e1909410dcd49318e7c3828324e

config:
  options:
    arch: '%{arch}'
  overrides:
    plugins/buildstream-plugins-community.bst: plugins/buildstream-plugins-community.bst
    freedesktop-sdk.bst: freedesktop-sdk.bst
