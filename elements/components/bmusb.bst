# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: make

description: a free driver for BlackMagic's Intensity Shuttle andUltraStudio SDI USB3 cards

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/pkg-config.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libusb.bst

sources:
# NOTE sesse seems to be down and has been for a few days. It is where everyone gets the source code from.
# In order to keep our system building and fresh, switch to Debian's source code cache until the DNS is addressed.
# git as a source is generally preferred because it makes it easier to track new versions. Still, they won't be
# releasing many new versions without a functional git server.
# - kind: git_repo
#   url: sesse:bmusb
#   ref: 0.7.8-0-g3615574c0d8c8564e1e091c8270f19138357777e
#   track: '*.*.*'
- kind: tar
  url: https://deb.debian.org/debian/pool/main/b/bmusb/bmusb_0.7.8.orig.tar.gz
  ref: e0a565e3db5d07a28a9f1aa1e2e60e483b143f9c5a84f161f2e1fa3498ec637d
