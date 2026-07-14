# SPDX-FileCopyrightText: 2026 Aleix Pol i Gonzalez <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: make

sources:
- kind: git_repo
  url: github:hramrach/lm-sensors.git
  track: 'V*'
  ref: V3-6-2-0-g5c3ba50f806dea27c3b1e368966191c735459111
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/flex.bst
- freedesktop-sdk.bst:components/bison.bst

variables:
  make: make PREFIX="%{prefix}"

  make-install: >-
    make BUILD_STATIC_LIB=0
    PREFIX="%{prefix}" SBINDIR="%{bindir}" MANDIR="%{mandir}"
    DESTDIR="%{install-root}" install
