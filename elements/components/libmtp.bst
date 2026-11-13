# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

description: Library implementation of the Media Transfer Protocol

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:components/libusb.bst
- freedesktop-sdk.bst:components/libgcrypt.bst

variables:
  conf-local: --with-udev=%{prefix}/lib/udev

sources:
- kind: anitya
  project-id: 10017
  url: https://downloads.sourceforge.net/libmtp/libmtp-{version}.tar.gz
  ref:
    version: "1.1.23"
    sha256sum: 74a2b6e8cb4a0304e95b995496ea3ac644c29371649b892b856e22f12a0bdeed
