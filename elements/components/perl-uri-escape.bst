# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

sources:
- kind: cpan
  index: 'cpan:'
  name: 'URI::Escape'
  suffix: authors/id/O/OA/OALDERS/URI-5.36.tar.gz
  sha256sum: 32719e57413db6e18492e104707b95c2210df637614c512e7368c9ec3c2f783b

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
