# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: meson

build-depends:
- freedesktop-sdk.bst:components/gtk-doc.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:components/libgudev.bst
- freedesktop-sdk.bst:components/libusb.bst
- freedesktop-sdk.bst:components/polkit-gobject.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libimobiledevice.bst

sources:
- kind: git_repo
  url: fdo:upower/upower.git
  track: 'v*'
  ref: v1.91.4-0-gaf22b0bb6a97fff89b0e11101de9fc4937832864
