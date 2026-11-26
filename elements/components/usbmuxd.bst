# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>
# SPDX-License-Identifier: BSD-2-Clause

kind: autotools

description: USB multiplexing daemon for Apple iOS devices

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/git.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/libusb.bst
- freedesktop-sdk.bst:components/libplist.bst
- freedesktop-sdk.bst:components/libimobiledevice-glue.bst
- freedesktop-sdk.bst:components/libimobiledevice.bst

variables:
  conf-local: >-
    --with-udev
    --with-udevrulesdir=%{indep-libdir}/udev/rules.d
    --with-systemdsystemunitdir=%{indep-libdir}/systemd/system

config:
  # configure wants a version from git or .tarball-version. Take it from the checkout
  # so it follows the ref when the source gets tracked.
  configure-commands:
    (<):
    - git describe --tags > .tarball-version

  install-commands:
    (>):
    - |
      install -d "%{install-root}%{indep-libdir}/sysusers.d"
      echo 'u usbmux - "usbmux daemon"' > "%{install-root}%{indep-libdir}/sysusers.d/usbmuxd.conf"

sources:
# The last release (1.1.1) is from 2020. master has years of fixes on top, e.g. it
# defaults to the USB mode with CDC NCM that tethering on newer iPhones needs.
- kind: git_repo
  url: github:libimobiledevice/usbmuxd.git
  track: master
  ref: 1.1.1-89-g78a75a31a6c016782a7aeb82cc14b331a7adbc83
