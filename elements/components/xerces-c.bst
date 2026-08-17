# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: A validating XML parser written in a portable subset of C++

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/curl.bst
- freedesktop-sdk.bst:components/icu.bst

sources:
- kind: anitya
  project-id: 5182
  url: 'https://www.apache.org/dist/xerces/c/{major}/sources/xerces-c-{version}.tar.gz'
  ref:
    version: 3.3.0
    sha256sum: 9555f1d06f82987fbb4658862705515740414fd34b4db6ad2ed76a2dc08d3bde
