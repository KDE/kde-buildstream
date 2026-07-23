# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by Arch Linux's PKGBUILD:
# https://gitlab.archlinux.org/archlinux/packaging/packages/containerd/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: An open and reliable container runtime

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:components/go-md2man.bst
- freedesktop-sdk.bst:components/pkg-config.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/btrfs-progs.bst
- freedesktop-sdk.bst:components/libseccomp.bst

config:
  build-commands:
  - |
    export GOFLAGS='-trimpath -mod=vendor -modcacherw'
    make VERSION=v2.3.3 GO_BUILD_FLAGS="$GOFLAGS" GO_GCFLAGS='' EXTRA_LDFLAGS='-buildid='
    make VERSION=v2.3.3 man
  install-commands:
  - |
    make PREFIX="%{prefix}" DESTDIR="%{install-root}" install
    install -Dm644 containerd.service "%{install-root}%{prefix}/lib/systemd/system/containerd.service"
    install -Dm644 man/*.8 -t "%{install-root}%{mandir}/man8"
    install -Dm644 man/*.5 -t "%{install-root}%{mandir}/man5"
    install -Dm644 contrib/autocomplete/ctr "%{install-root}%{datadir}/bash-completion/completions/ctr"
    install -Dm644 contrib/autocomplete/zsh_autocomplete "%{install-root}%{datadir}/zsh/site-functions/_ctr"

sources:
- kind: git_repo
  url: github:containerd/containerd.git
  track: 'v*'
  ref: v2.3.3-0-gaad11006b869517fcd3009450b6f82da282e1a9b
