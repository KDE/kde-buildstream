# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

description: NVIDIA container runtime library and command line utility

build-depends:
- freedesktop-sdk.bst:components/elfutils.bst
- freedesktop-sdk.bst:components/libcap.bst
- freedesktop-sdk.bst:components/libseccomp.bst
- freedesktop-sdk.bst:components/patch.bst
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/which.bst
- freedesktop-sdk-extra.bst:components/rpcsvc-proto.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:components/elfutils.bst
- freedesktop-sdk.bst:components/libcap.bst
- freedesktop-sdk.bst:components/libseccomp.bst
- freedesktop-sdk.bst:components/libtirpc.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  version: 1.20.1
  revision: 3e428194f8616a81e16834d27365e4a663668533

config:
  configure-commands:
  # Use the SDK's shared libtirpc instead of downloading a private static copy.
  - |
    sed -i \
      -e 's|$(DEPS_DIR)$(includedir)/tirpc|$(includedir)/tirpc|' \
      -e 's|LIB_LDLIBS_STATIC  += -l:libtirpc.a|LIB_LDLIBS_SHARED  += -ltirpc|' \
      -e '\|$(MAKE) -f $(MAKE_DIR)/libtirpc.mk DESTDIR=$(DEPS_DIR) install|d' Makefile
  - patch -d deps/src/nvidia-modprobe-550.54.14 -p1 < mk/nvidia-modprobe.patch
  - touch deps/src/nvidia-modprobe-550.54.14/.download_stamp
  build-commands:
  - make -f versions.mk -f Makefile LIB_VERSION=%{version} REVISION=%{revision} WITH_LIBELF=yes WITH_TIRPC=yes WITH_SECCOMP=yes WITH_NVCGO=yes prefix="%{prefix}" libdir="%{libdir}" DESTDIR="%{install-root}"
  install-commands:
  - make -f versions.mk -f Makefile LIB_VERSION=%{version} REVISION=%{revision} WITH_LIBELF=yes WITH_TIRPC=yes WITH_SECCOMP=yes WITH_NVCGO=yes prefix="%{prefix}" libdir="%{libdir}" DESTDIR="%{install-root}" install

sources:
- kind: git_repo
  url: github:NVIDIA/libnvidia-container.git
  track: v*
  exclude:
  - '*-rc*'
  ref: v1.20.1-0-g3e428194f8616a81e16834d27365e4a663668533
- kind: git_repo
  url: github:NVIDIA/nvidia-modprobe.git
  track: '550.*'
  ref: 550.54.14-0-g149440ca0654d928f27df5ebff485a122bfe43b1
  directory: deps/src/nvidia-modprobe-550.54.14
