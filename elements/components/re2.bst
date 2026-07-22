# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/abseil-cpp.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/abseil-cpp.bst

config:
  build-commands:
  - make shared CXXFLAGS="${CXXFLAGS} -std=c++20"
  install-commands:
  - >-
    make
    DESTDIR="%{install-root}"
    prefix="%{prefix}"
    includedir="%{includedir}"
    libdir="%{libdir}"
    shared-install

sources:
- kind: git_repo
  url: github:google/re2.git
  track: '2025-11-05'
