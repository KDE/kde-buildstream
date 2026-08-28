# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

# Forked from freedesktop-sdk to have it depent on Qt.

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/texinfo.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libassuan.bst
- freedesktop-sdk.bst:components/libgpg-error.bst
- freedesktop-sdk.bst:components/libsecret.bst
- qt/qtbase.bst

variables:
  autogen: autoreconf -vif -I %{datadir}/gettext/m4
  conf-local: >-
    --enable-pinentry-curses
    --enable-pinentry-tty
    --enable-pinentry-qt
    --enable-libsecret
    --disable-pinentry-gtk2
    --disable-pinentry-gnome3
    --disable-pinentry-fltk
    --disable-doc

sources:
- kind: git_repo
  url: github:gpg/pinentry.git
  track: pinentry-*
  exclude:
  - '*-base'
  ref: pinentry-1.3.3-0-g9a7b78e9882b8261b0be439cccf5651b9dd971a8
