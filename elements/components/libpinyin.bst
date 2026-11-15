# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/git.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/glib.bst
- components/kyotocabinet.bst

variables:
  conf-local: --with-dbm=KyotoCabinet

sources:
- kind: git_repo
  url: github:libpinyin/libpinyin.git
  track: '*.*.*'
  ref: 2.11.91-0-g0c5e80e1200f84fab185d1c5bde458b770a0636c
- kind: tar
  url: https://downloads.sourceforge.net/libpinyin/models/model20.text.tar.gz
  ref: 59c68e89d43ff85f5a309489499cbcde282d2b04bd91888734884b7defcb1155
  base-dir: ''
  directory: data
