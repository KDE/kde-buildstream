# SPDX-FileCopyrightText: none
# SPDX-License-Identifier: CC0-1.0
# Maintained manually while KDE CI traces are unavailable.
kind: cmake
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
depends:
- components/qcoro.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/systemd.bst
- qt/qtbase.bst
- kde/extra-cmake-modules.bst
- kde/kcmutils.bst
- kde/kconfig.bst
- kde/kcoreaddons.bst
- kde/ki18n.bst
- kde/kio.bst
runtime-depends:
- freedesktop-sdk-extra.bst:components/python3-httpx.bst
- freedesktop-sdk-extra.bst:components/python3-websockets.bst
- components/python3-dbus-fast.bst
- freedesktop-sdk.bst:components/python3-pyyaml.bst
- components/python3-pydantic.bst
variables:
  cmake-local: -DCMAKE_BUILD_TYPE=RelWithDebInfo -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    -DBUILD_HTML_DOCS=OFF -DBUILD_MAN_DOCS=OFF -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF
    -DVENDOR_PYTHON_DEPS=OFF -DBUILD_QCH=OFF -DCMAKE_INSTALL_LIBEXECDIR=lib -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF
    -DCMAKE_PREFIX_PATH=/buildstream-install/usr -DCMAKE_FIND_ROOT_PATH=/buildstream-install
    -DCMAKE_CXX_FLAGS:STRING=-pipe -DCMAKE_INSTALL_PREFIX=/usr/
sources:
- kind: git_repo
  url: kde:kde-linux/kapsule.git
  track: master
  ref: a868c9d72169d14b8411d0caf8a8f98c01072da5
