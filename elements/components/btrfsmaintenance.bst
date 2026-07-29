# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/btrfsmaintenance/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: Btrfs maintenance scripts

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/btrfs-progs.bst
- freedesktop-sdk.bst:components/systemd.bst

config:
  install-commands:
  - |
    install -Dm755 btrfs-defrag.sh "%{install-root}%{datadir}/btrfsmaintenance/btrfs-defrag.sh"
    install -Dm755 btrfs-balance.sh "%{install-root}%{datadir}/btrfsmaintenance/btrfs-balance.sh"
    install -Dm755 btrfs-scrub.sh "%{install-root}%{datadir}/btrfsmaintenance/btrfs-scrub.sh"
    install -Dm755 btrfs-trim.sh "%{install-root}%{datadir}/btrfsmaintenance/btrfs-trim.sh"
    install -Dm755 btrfsmaintenance-refresh-cron.sh "%{install-root}%{datadir}/btrfsmaintenance/btrfsmaintenance-refresh-cron.sh"
    install -Dm644 btrfsmaintenance-functions "%{install-root}%{datadir}/btrfsmaintenance/btrfsmaintenance-functions"
    install -Dm644 btrfsmaintenance-refresh.service "%{install-root}%{indep-libdir}/systemd/system/btrfsmaintenance-refresh.service"
    install -Dm644 btrfsmaintenance-refresh.path "%{install-root}%{indep-libdir}/systemd/system/btrfsmaintenance-refresh.path"
    install -Dm644 btrfs-balance.service "%{install-root}%{indep-libdir}/systemd/system/btrfs-balance.service"
    install -Dm644 btrfs-defrag.service "%{install-root}%{indep-libdir}/systemd/system/btrfs-defrag.service"
    install -Dm644 btrfs-scrub.service "%{install-root}%{indep-libdir}/systemd/system/btrfs-scrub.service"
    install -Dm644 btrfs-trim.service "%{install-root}%{indep-libdir}/systemd/system/btrfs-trim.service"
    install -Dm644 btrfs-balance.timer "%{install-root}%{indep-libdir}/systemd/system/btrfs-balance.timer"
    install -Dm644 btrfs-defrag.timer "%{install-root}%{indep-libdir}/systemd/system/btrfs-defrag.timer"
    install -Dm644 btrfs-scrub.timer "%{install-root}%{indep-libdir}/systemd/system/btrfs-scrub.timer"
    install -Dm644 btrfs-trim.timer "%{install-root}%{indep-libdir}/systemd/system/btrfs-trim.timer"
    install -Dm644 sysconfig.btrfsmaintenance "%{install-root}%{sysconfdir}/sysconfig/btrfsmaintenance"

sources:
- kind: git_repo
  url: github:kdave/btrfsmaintenance.git
  track: 'v*'
  ref: v0.5.2-0-gbeb9e2d166cbd856297fe8d28e89e8b36961a723
