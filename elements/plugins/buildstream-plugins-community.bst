# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: junction

sources:
# Temporarily use aleixpol/fix-gomod-gosum until the fix is released.
# https://gitlab.com/BuildStream/buildstream-plugins-community/-/merge_requests/521
- kind: tar
  url: gitlab:apol/buildstream-plugins-community/-/archive/c0e59f5accc1c3f442e6601a6665374a3f7de623/buildstream-plugins-community-c0e59f5accc1c3f442e6601a6665374a3f7de623.tar.gz
  ref: cffa06e16f4743245302e9f55a54f6cb18175236a5844afc4b6c9feb10811032
