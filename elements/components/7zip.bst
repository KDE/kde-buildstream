# SPDX-FileCopyrightText: 2026 KDE Linux Contributors
# SPDX-License-Identifier: BSD-2-Clause

kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  command-subdir: CPP/7zip/Bundles/Alone2
  make-args: >-
    -f ../../cmpl_gcc.mak
    LFLAGS_STRIP=
    CFLAGS_WARN_WALL="-Wall -Wextra"
    CC="gcc $CPPFLAGS $CFLAGS"
    CXX="g++ $CPPFLAGS $CXXFLAGS"
    LDFLAGS="$LDFLAGS"

config:
  install-commands:
  - install -Dm755 b/g/7zz '%{install-root}%{bindir}/7zz'
  - ln -s 7zz '%{install-root}%{bindir}/7z'
  - install -Dm644 -t '%{install-root}%{datadir}/licenses/7zip' ../../../../DOC/License.txt ../../../../DOC/unRarLicense.txt

sources:
- kind: git_repo
  url: github:ip7z/7zip.git
  track: '*.*'
  ref: 26.06-0-gd3296e39e1f1f92c7b41c0c3848e65640428d42d
