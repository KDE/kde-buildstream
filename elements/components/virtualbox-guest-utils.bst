# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: anitya
  project-id: 14449
  url: 'https://download.virtualbox.org/virtualbox/{version}/VirtualBox-{version}.tar.bz2'
  ref:
    version: 7.2.16
    sha256sum: 50356ccdaefe8f03537600ec31898b506e3a85ce79b94f26fb6cc1920c9e18eb
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/virtualbox-host-dkms.conf?ref_type=heads
  ref: f753501352054576c510aa81e83f4935079ea620e601057784b02b4d4d1eeb04
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/virtualbox.sysusers?ref_type=heads
  ref: 2101ebb58233bbfadf3aa74381f22f7e7e508559d2b46387114bc2d8e308554c
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/virtualbox-guest-utils.sysusers?ref_type=heads
  ref: da4c49f6ca94e047e196cdbcba2c321199f4760056ea66e0fbc659353e128c9e
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/60-vboxdrv.rules?ref_type=heads
  ref: f876e9f55243eded423fda4fc2ffe3b174dca90380a6315f7c9b3cd1c9d07206
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/60-vboxguest.rules?ref_type=heads
  ref: 033c597e0f5285d2ddb0490868e5b6f945f45c7b1b1152a02a9e6fea438b2c95
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/LocalConfig.kmk?ref_type=heads
  ref: 942743b5ef38eecd8ebcb8682c2c65e1be377b4af83fa54d28cd71385f26dc5a
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/vboxservice.service?ref_type=heads
  ref: 6aaa51b59595c76aab7bc773453e6e739950693d5336548f9a896695e0decb14
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/vboxservice-nox.service?ref_type=heads
  ref: 01dbb921bd57a852919cc78be5b73580a564f28ebab2fe8d6c9b8301265cbfce
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/vboxweb.service?ref_type=heads
  ref: e6e875ef186578b53106d7f6af48e426cdaf1b4e86834f01696b8ef1c685787f
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/virtualbox/-/raw/main/vboxreload?ref_type=heads
  ref: 4001b5927348fe669a541e80526d4f9ea91b883805f102f7d571edbb482a9b9d
