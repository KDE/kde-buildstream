# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
- qt/qtbase.bst
- qt/qtdeclarative.bst
- qt/qtpositioning.bst
- qt/qtwebchannel.bst
- freedesktop-sdk-extra.bst:components/nodejs.bst
- gnome-build-meta.bst:sdk/krb5.bst
- components/python-html5lib.bst
- components/re2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{prefix}/bin'
        - '%{prefix}/bin/**'

variables:
  cmake-local: >-
    -DQT_FEATURE_webengine_system_icu=ON
    -DQT_FEATURE_webengine_proprietary_codecs=ON
    -DQT_FEATURE_webengine_kerberos=ON
    -DQT_FEATURE_webengine_webrtc_pipewire=ON

    # -DQT_FEATURE_webengine_system_re2=ON
    # -DQT_FEATURE_webengine_system_ffmpeg=ON
    # -DQT_FEATURE_webengine_system_openh264=ON

sources:
- kind: anitya
  project-id: 7927
  url: 'qt:{major}.{minor}/{version}/submodules/qtwebengine-everywhere-src-{version}.tar.xz'
  ref:
    version: 6.11.2
    sha256sum: 6101c1aa00ff933d1b65ee5d167f76e8d71b9ac5b378b0111277723ebda7c163
