# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: Query and change Linux monitor settings using DDC/CI and USB.

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
# - components/i2c-tools.bst
- freedesktop-sdk.bst:bootstrap/acl.bst
- freedesktop-sdk.bst:bootstrap/glibc.bst
- freedesktop-sdk.bst:components/dbus.bst
- freedesktop-sdk.bst:components/gcc-libs.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/jansson.bst
- freedesktop-sdk.bst:components/libdrm.bst
- freedesktop-sdk.bst:components/libusb.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:components/xorg-lib-x11.bst
- freedesktop-sdk.bst:components/xorg-lib-xext.bst
- freedesktop-sdk.bst:components/xorg-lib-xrandr.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:rockowitz/ddcutil.git
  track: '*'
  ref: v3.0.1-0-gbbe30d7f7add0ea1ce29feb2af6ae1160ad20d01
