# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>

kind: cmake

description: Configure X11 applications via XSETTINGS specification

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/xorg-lib-xfixes.bst

depends:
- freedesktop-sdk.bst:components/xorg-lib-xfixes.bst

sources:
- kind: git_repo
  url: codeberg:derat/xsettingsd
  track: 'v*'
  ref: v1.0.4-0-gfd8029153ad2c9bcc0342b6c337034912093d6cf
