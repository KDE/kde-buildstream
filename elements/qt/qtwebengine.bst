# SPDX-FileCopyrightText: 2026 Aleix Pol <aleixpol@kde.org>
#
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:sdk.bst
depends:
- components/re2.bst
- freedesktop-sdk.bst:components/alsa-lib.bst
- freedesktop-sdk.bst:components/ffmpeg.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/freetype.bst
- freedesktop-sdk.bst:components/glib.bst
- freedesktop-sdk.bst:components/gperf.bst
- freedesktop-sdk.bst:components/harfbuzz.bst
- freedesktop-sdk.bst:components/icu.bst
- freedesktop-sdk.bst:components/jpeg.bst
- freedesktop-sdk.bst:components/krb5.bst
- freedesktop-sdk.bst:components/lcms.bst
- freedesktop-sdk.bst:components/libdbus.bst
- freedesktop-sdk.bst:components/libpng.bst
- freedesktop-sdk.bst:components/libpulse.bst
- freedesktop-sdk.bst:components/libtiff.bst
- freedesktop-sdk.bst:components/libva.bst
- freedesktop-sdk.bst:components/libvpx.bst
- freedesktop-sdk.bst:components/libwebp.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/nss.bst
- freedesktop-sdk.bst:components/openjpeg.bst
- freedesktop-sdk.bst:components/opus.bst
- freedesktop-sdk.bst:components/pciutils.bst
- freedesktop-sdk.bst:components/rust-bindgen.bst
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:components/xorg-lib-x11.bst
- freedesktop-sdk.bst:components/xorg-lib-xcb.bst
- freedesktop-sdk.bst:components/xorg-lib-xcomposite.bst
- freedesktop-sdk.bst:components/xorg-lib-xcursor.bst
- freedesktop-sdk.bst:components/xorg-lib-xdamage.bst
- freedesktop-sdk.bst:components/xorg-lib-xi.bst
- freedesktop-sdk.bst:components/xorg-lib-xkbfile.bst
- freedesktop-sdk.bst:components/xorg-lib-xrandr.bst
- freedesktop-sdk.bst:components/xorg-lib-xshmfence.bst
- freedesktop-sdk.bst:components/xorg-lib-xtst.bst
- freedesktop-sdk.bst:components/xorg-proto-xorgproto.bst
- freedesktop-sdk.bst:components/bison.bst
- freedesktop-sdk.bst:components/flex.bst
- freedesktop-sdk.bst:components/perl.bst
- freedesktop-sdk.bst:components/python3.bst
- qt/qtbase.bst
- qt/qtdeclarative.bst
- qt/qtpositioning.bst
- qt/qttools.bst
- qt/qtwebchannel.bst
public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{prefix}/bin'
        - '%{prefix}/bin/**'
variables:
  cmake-local: '-DQT_FEATURE_webengine_system_icu=ON -DQT_FEATURE_webengine_proprietary_codecs=ON
    -DQT_FEATURE_webengine_kerberos=ON -DQT_FEATURE_webengine_webrtc_pipewire=ON

    # -DQT_FEATURE_webengine_system_re2=ON # -DQT_FEATURE_webengine_system_ffmpeg=ON
    # -DQT_FEATURE_webengine_system_openh264=ON'
sources:
- kind: anitya
  project-id: 7927
  url: qt:{major}.{minor}/{version}/submodules/qtwebengine-everywhere-src-{version}.tar.xz
  ref:
    version: 6.11.2
    sha256sum: 6101c1aa00ff933d1b65ee5d167f76e8d71b9ac5b378b0111277723ebda7c163
