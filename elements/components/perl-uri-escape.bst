# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

sources:
- kind: cpan
  index: 'cpan:'
  name: 'URI::Escape'
  suffix: authors/id/O/OA/OALDERS/URI-5.40.tar.gz
  sha256sum: ef5d2ef099a1a24a6e83ffe543de73337805d3d39c00b84fa205d725ad1a1b63

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
