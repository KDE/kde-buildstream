# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

description: Select dbus-broker as the system and user D-Bus implementation

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

depends:
- freedesktop-sdk.bst:components/dbus-broker.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -d \
      "%{install-root}%{indep-libdir}/systemd/system" \
      "%{install-root}%{indep-libdir}/systemd/user"
    ln -s dbus-broker.service "%{install-root}%{indep-libdir}/systemd/system/dbus.service"
    ln -s dbus-broker.service "%{install-root}%{indep-libdir}/systemd/user/dbus.service"

public:
  bst:
    overlap-whitelist:
    - "%{indep-libdir}/systemd/system/dbus.service"
    - "%{indep-libdir}/systemd/user/dbus.service"
