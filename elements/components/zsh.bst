# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: A very advanced and programmable command interpreter

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:bootstrap/ncurses.bst
- freedesktop-sdk.bst:bootstrap/pcre2.bst
- freedesktop-sdk.bst:components/gdbm.bst
- freedesktop-sdk.bst:components/groff.bst
- freedesktop-sdk.bst:components/libcap.bst
- freedesktop-sdk.bst:components/stripper.bst
- freedesktop-sdk.bst:components/util-linux.bst
- components/yodl.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/ncurses.bst
- freedesktop-sdk.bst:bootstrap/pcre2.bst
- freedesktop-sdk.bst:components/gdbm.bst
- freedesktop-sdk.bst:components/libcap.bst

variables:
  conf-local: >-
    --docdir="%{datadir}/doc/zsh"
    --htmldir="%{datadir}/doc/zsh/html"
    --enable-etcdir="%{sysconfdir}/zsh"
    --enable-zshenv="%{sysconfdir}/zsh/zshenv"
    --enable-zlogin="%{sysconfdir}/zsh/zlogin"
    --enable-zlogout="%{sysconfdir}/zsh/zlogout"
    --enable-zprofile="%{sysconfdir}/zsh/zprofile"
    --enable-zshrc="%{sysconfdir}/zsh/zshrc"
    --enable-maildir-support
    --with-term-lib="tinfow ncursesw"
    --enable-multibyte
    --enable-function-subdirs
    --enable-fndir="%{datadir}/zsh/functions"
    --enable-scriptdir="%{datadir}/zsh/scripts"
    --with-tcsetpgrp
    --enable-pcre
    --enable-gdbm
    --enable-cap
    --enable-zsh-secure-free

config:
  configure-commands:
    (<):
    - sed -i 's#/usr/share/keymaps#/usr/share/kbd/keymaps#g' Completion/Unix/Command/_loadkeys
    - sed -i 's#/usr/share/misc/usb.ids#/usr/share/hwdata/usb.ids#g' Completion/Linux/Command/_lsusb
    - |
      for fpath in AIX BSD Cygwin Darwin Debian Mandriva openSUSE Redhat Solaris; do
        rm -rf "Completion/${fpath}"
        sed -i "s#\\s*Completion/${fpath}/\\*/\\*##g" Src/Zle/complete.mdd
      done
    - rm Completion/Linux/Command/_pkgtool
  install-commands:
    (>):
    - install -Dm644 zprofile "%{install-root}%{sysconfdir}/zsh/zprofile"
    - |
      cd "%{install-root}%{bindir}"
      rm zsh
      ln -s zsh-* zsh

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{includedir}/zsh/**'

sources:
- kind: git_repo
  url: sourceforge_git:zsh/code
  track: 'zsh-*'
  ref: zsh-5.9.2-0-gddee3e7a751a4f03d5a1041fd44bb7af7bc0cebb
- kind: local
  path: files/zsh/zprofile
