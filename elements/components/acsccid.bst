# SPDX-FileCopyrightText: 2025 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/gettext.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/pcsc-lite.bst
- freedesktop-sdk.bst:components/libusb.bst

sources:
- kind: anitya
  project-id: 15661
  url: 'https://downloads.sourceforge.net/acsccid/acsccid-{version}.tar.bz2'
  ref:
    version: 1.1.13
    sha256sum: 8b19aba103ec03c448b9d1b562c8322f8d2ff37cf21d4cb8b0cf522c5f385c9f
