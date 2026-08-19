# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

sources:
- kind: cpan
  index: 'cpan:'
  name: 'URI::Escape'
  suffix: authors/id/O/OA/OALDERS/URI-5.35.tar.gz
  sha256sum: 89648964ce5ae006726951f42f718576fbefe9e98a41bd2212d57386163092d2

depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:components/perl.bst

config:
  configure-commands:
  - perl Makefile.PL PREFIX="%{install-root}%{prefix}" INSTALLDIRS=vendor

  build-commands:
  - make

  install-commands:
  - make install
