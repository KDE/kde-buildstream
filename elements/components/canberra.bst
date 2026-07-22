# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:sdk.bst

sources:
- kind: git_repo
  url: salsa:gnome-team/libcanberra.git
  track: upstream/0.30
  ref: upstream/0.30-0-g7143556495c7b61d9875631ddde6ba2658ace3d5
