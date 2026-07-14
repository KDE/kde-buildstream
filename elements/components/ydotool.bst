# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

description: Generic command-line automation tool without X11 dependencies

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/scdoc.bst
- freedesktop-sdk.bst:components/systemd.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  cmake-local: -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_MANDIR=%{mandir} 
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

config:
  install-commands:
    (>):
    - install -Dm644 80-uinput.rules 
      "%{install-root}%{prefix}/lib/udev/rules.d/80-uinput.rules"

sources:
- kind: git_repo
  url: github:ReimuNotMoe/ydotool.git
  track: 'v*'
  ref: v1.0.4-0-g57ba7d0af525e82da2de0e275d169477f293b197
- kind: local
  path: files
