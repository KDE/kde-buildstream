# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

build-depends:
- freedesktop-sdk.bst:sdk.bst

config:
  install-commands:
  - ./bootstrap.sh --prefix=%{install-root}/usr --with-libraries=filesystem,system,program_options,iostreams,container,thread
  - ./b2 headers
  - ./b2 install

sources:
- kind: anitya
  project-id: 6845
  url: 'https://archives.boost.io/release/{version}/source/boost_{major}_{minor}_{patch}.tar.bz2'
  ref:
    version: 1.92.0
    sha256sum: 5c1d40cb8e19adbf740a4ec2da35b3e58f3f5804b1dce44deb53df72193cbc6c
