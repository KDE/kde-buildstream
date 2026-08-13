# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: Tool for managing filesystem snapshots

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/gettext.bst
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/lvm2.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:bootstrap/acl.bst
- freedesktop-sdk.bst:components/btrfs-progs.bst
- freedesktop-sdk.bst:components/dbus.bst
- freedesktop-sdk.bst:components/json-c.bst
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/util-linux.bst
- freedesktop-sdk.bst:components/zlib.bst
- components/boost.bst

variables:
  conf-local: >-
    --with-conf=%{sysconfdir}/sysconfig
    --disable-bcachefs
    --disable-ext4
    --disable-pam
    --disable-zypp
    --disable-silent-rules
    --enable-btrfs-quota

config:
  configure-commands:
    (<):
    - |
      sed -i 's|/usr/sbin/snapperd|%{bindir}/snapperd|' \
          data/snapperd.service data/org.opensuse.Snapper.service

      sed -i 's|/usr/sbin/snbk|%{bindir}/snbk|' data/backup.service

  install-commands:
    (>):
    - |
      rm -rf "%{install-root}%{sysconfdir}/cron.hourly"

      rm -rf "%{install-root}%{libdir}/snapper/testsuite"

sources:
- kind: git_repo
  url: github:openSUSE/snapper.git
  track: 'v*'
  exclude:
  - '*rc*'
  - '*beta*'
  ref: v0.13.1-0-g8cfc33817b91dbf7194d7fd043dc378026d01db5
