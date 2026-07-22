# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: This package contains an OCR engine - libtesseract and a command line program - tesseract

depends:
- freedesktop-sdk.bst:components/gcc-libs.bst
- freedesktop-sdk.bst:components/curl.bst
- freedesktop-sdk.bst:components/libarchive.bst
- components/leptonica.bst

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/icu.bst
- freedesktop-sdk.bst:components/pango.bst
- freedesktop-sdk.bst:components/asciidoc.bst

sources:
- kind: git_repo
  url: github:tesseract-ocr/tesseract.git
  track: '*'
  ref: 5.5.2-0-g6e1d56a847e697de07b38619356550e5cf4e8633
config:
  build-commands:
    (>):
    - |
      make training

  install-commands:
    (>):
    - |
      make DESTDIR="%{install-root}" training-install
