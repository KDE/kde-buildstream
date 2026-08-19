# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/nfs-utils/-/raw/main/PKGBUILD?ref_type=heads
kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/keyutils.bst
- freedesktop-sdk.bst:components/libnl.bst
- freedesktop-sdk.bst:components/libevent.bst
- freedesktop-sdk.bst:components/libtirpc.bst
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/util-linux.bst
- components/rpcsvc-proto.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/keyutils.bst
- freedesktop-sdk.bst:components/libnl.bst
- freedesktop-sdk.bst:components/libevent.bst
- freedesktop-sdk.bst:components/libtirpc.bst
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/util-linux.bst

variables:
  conf-local: >-
    --disable-gss
    --sbindir=%{bindir}
    --with-rpcgen
  make-install: |
    make -j1 %{make-install-args}
    install -Dm755 "%{install-root}/sbin/mount.nfs" "%{install-root}%{bindir}/mount.nfs"
    install -Dm755 "%{install-root}/sbin/mount.nfs4" "%{install-root}%{bindir}/mount.nfs4"
    install -Dm755 "%{install-root}/sbin/umount.nfs" "%{install-root}%{bindir}/umount.nfs"
    install -Dm755 "%{install-root}/sbin/umount.nfs4" "%{install-root}%{bindir}/umount.nfs4"
    rm -rf "%{install-root}/sbin"

sources:
- kind: anitya
  project-id: 2081
  url: 'https://www.kernel.org/pub/linux/utils/nfs-utils/{version}/nfs-utils-{version}.tar.xz'
  ref:
    version: 2.9.2
    sha256sum: e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280ed86c9d3dc4097e8c
