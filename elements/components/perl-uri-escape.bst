# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

sources:
- kind: cpan
  index: 'cpan:'
  name: 'URI::Escape'
  suffix: authors/id/O/OA/OALDERS/URI-5.38.tar.gz
  sha256sum: 6cd49ac0bba005842458ea17a2f5b58c146f3884b846c91aecf2cec4320dc6bf

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
