# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: script

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst
- filename: os/deps.bst
  config:
    location: /sysroot

config:
  root-read-only: true
  commands:
  - |
    for directory in bin sbin lib; do
      if [ -e "/sysroot/$directory" ] && [ ! -L "/sysroot/$directory" ]; then
        echo "os/deps.bst installs into /$directory; install under %{prefix} instead"
        ls -la "/sysroot/$directory"
        exit 1
      fi
    done
