# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-FileCopyrightText: Aleix Pol i Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: MIT

kind: meson

sources:
- kind: git_repo
  url: github:systemd/systemd.git
  track: v*
  exclude:
  - '*rc*'
  ref: v262.2-0-g63511d7283d7d0e2a2fc28075481afaf1a7be8f5
  version-guess-pattern: '(\d+)(?:\.(\d+))?'
- kind: local
  path: files/systemd/90-sysupdate.preset

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:bootstrap/sed.bst
- freedesktop-sdk.bst:bootstrap/gawk.bst
- freedesktop-sdk.bst:bootstrap/grep.bst
- freedesktop-sdk.bst:bootstrap/diffutils.bst
- freedesktop-sdk.bst:components/audit.bst
- freedesktop-sdk.bst:components/gperf.bst
- freedesktop-sdk.bst:components/m4.bst
- freedesktop-sdk.bst:components/libapparmor.bst
- freedesktop-sdk.bst:components/libcap.bst
- freedesktop-sdk.bst:components/libgcrypt.bst
- freedesktop-sdk.bst:components/libgpg-error.bst
- freedesktop-sdk.bst:components/libseccomp.bst
- freedesktop-sdk.bst:components/lz4.bst
- freedesktop-sdk.bst:components/zstd.bst
- freedesktop-sdk.bst:components/util-linux-libfdisk.bst
- freedesktop-sdk.bst:components/util-linux-libs.bst
# systemd services exist that call `agetty`, `fsck`, `mkswap` from util-linux-full.
- freedesktop-sdk.bst:components/util-linux-full.bst
- freedesktop-sdk.bst:components/libarchive.bst
- freedesktop-sdk.bst:components/linux-pam.bst
- freedesktop-sdk.bst:components/kmod.bst
- freedesktop-sdk.bst:components/python3-pyelftools.bst
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/_private/cryptsetup-lvm2-stage1.bst
- freedesktop-sdk.bst:components/p11-kit.bst
- freedesktop-sdk.bst:components/libfido2.bst
- freedesktop-sdk.bst:components/libidn2.bst
- freedesktop-sdk.bst:components/openssl.bst
- freedesktop-sdk.bst:components/python3-pefile.bst
- freedesktop-sdk.bst:components/python3-jinja2.bst
- freedesktop-sdk.bst:components/apparmor.bst
- freedesktop-sdk.bst:components/tpm2-tss.bst
- freedesktop-sdk.bst:components/curl.bst
- freedesktop-sdk.bst:components/libqrencode.bst
- freedesktop-sdk.bst:components/iptables.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/libmicrohttpd.bst
- freedesktop-sdk.bst:components/bpf-maybe.bst
- freedesktop-sdk.bst:components/libbpf.bst
- freedesktop-sdk.bst:components/llvm.bst

variables:
  # The SDK filters share these licenses and whitelist this directory.
  project_licensedir: '%{licensedir}/freedesktop-sdk'
  efi: 'false'
  bpf-framework: 'disabled'
  (?):
  - arch in ["x86_64", "i686", "aarch64", "riscv64", "loongarch64"]:
      efi: 'true'
  - arch in ["x86_64", "aarch64"]:
      bpf-framework: 'enabled'

  meson-local: >-
    -Dmode=release
    -Dfallback-hostname=kde-linux
    -Daudit=enabled
    -Dseccomp=enabled
    -Dsystem-uid-max=999
    -Dsystem-gid-max=999
    -Dusers-gid=100
    -Dopenssl=enabled
    -Dpam=enabled
    -Dbootloader=%{efi}
    -Defi=%{efi}
    -Dfirstboot=true
    -Dzlib=enabled
    -Dzstd=enabled
    -Dbzip2=enabled
    -Dxz=enabled
    -Dlz4=enabled
    -Ddefault-dnssec=no
    -Didn=true
    -Drepart=enabled
    -Dman=enabled
    -Dhtml=enabled
    -Dlibcryptsetup=enabled
    -Dlibcryptsetup-plugins=enabled
    -Dp11kit=enabled
    -Dlibfido2=enabled
    -Dapparmor=enabled
    -Dtpm=true
    -Dtpm2=enabled
    -Dsbat-distro=kde-linux
    -Dsbat-distro-generation=1
    -Dsbat-distro-summary="KDE Linux"
    -Dsbat-distro-url=https://linux.kde.org
    -Dversion-tag="$(git describe --abbrev=7 | sed "s/^v//")"
    -Dqrencode=enabled
    -Dxkbcommon=enabled
    -Dlibidn2=enabled
    -Dxenctrl=disabled
    -Dbpf-framework=%{bpf-framework}
    -Dgnutls=disabled
    -Dglib=disabled
    -Ddbus=disabled
    -Dukify=%{efi}
    -Dkernel-install=true
    -Dvmlinux-h=provided
    -Dvmlinux-h-path='%{includedir}/%{gcc_triplet}/linux/vmlinux.h'
    -Dselinux=disabled
    -Dsysupdated=enabled

config:
  install-commands:
    (>):
    - |
      shopt -s nullglob
      for name in %{install-root}%{indep-libdir}/systemd/boot/efi/*.elf.stub
      do
      chmod a-x ${name}
      done
      shopt -u nullglob

    - |
      install -Dm644 -t '%{install-root}%{indep-libdir}/systemd/system-preset' 90-sysupdate.preset

public:
  cpe:
    vendor: 'freedesktop'
    product: 'systemd'

  bst:
    split-rules:
      kernel-install:
      - '%{bindir}/kernel-install'
      - '%{datadir}/bash-completion/completions/kernel-install'
      - '%{datadir}/zsh/site-functions/_kernel-install'
      - '%{indep-libdir}/kernel'
      - '%{indep-libdir}/kernel/**'
      - '%{mandir}/man8/kernel-install.8'
      - '%{debugdir}%{bindir}/kernel-install.debug'
      ukify:
      - '%{bindir}/ukify'
      - '%{indep-libdir}/systemd/ukify'
      - '%{mandir}/man1/ukify.1'
      systemd-libs:
      - '%{libdir}'
      - '%{libdir}/libsystemd*.so*'
      - '%{libdir}/libudev*.so*'
      - '%{libdir}/libnss_resolve.so*'
      - '%{libdir}/pkgconfig'
      - '%{libdir}/pkgconfig/libsystemd.pc'
      - '%{libdir}/pkgconfig/libudev.pc'
      - '%{includedir}'
      - '%{includedir}/libudev.h'
      - '%{includedir}/systemd'
      - '%{includedir}/systemd/**'
      - '%{debugdir}/dwz/%{stripdir-suffix}/*'
      - '%{debugdir}%{libdir}/libsystemd*.so*'
      - '%{debugdir}%{libdir}/libudev*.so*'
      - '%{debugdir}%{libdir}/libnss_resolve.so*'
      - '%{sourcedir}'
      - '%{sourcedir}/**'
      systemd-license:
      - "%{project_licensedir}"
      - "%{project_licensedir}/**"
