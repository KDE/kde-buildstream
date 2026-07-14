# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: meson

description: Small utility to dump info about DRM devices

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/scdoc.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/json-c.bst
- freedesktop-sdk.bst:components/libdisplay-info.bst
- freedesktop-sdk.bst:components/libdrm.bst
- freedesktop-sdk.bst:components/pciutils.bst

sources:
- kind: git_repo
  url: fdo:emersion/drm_info.git
  track: 'v*'
  ref: v2.10.0-0-g462458e0f292145b2a9d5a8b65c392eaeef7362d
