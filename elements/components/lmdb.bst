# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:sdk.bst

variables:
  autogen: echo "echo $@" > configure; chmod +x configure
  command-subdir: libraries/liblmdb
  make-args: prefix="%{prefix}"
  make-install-args: DESTDIR="%{install-root}" %{make-args} install

sources:
- kind: git_repo
  url: github:LMDB/lmdb.git
  track: 'LMDB_*'
  ref: LMDB_1.0.0-branch-0-g340f04593e3a05db615b3444fac9f3572ed75e3f
