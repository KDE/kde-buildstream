# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

build-depends:
- freedesktop-sdk.bst:components/findutils.bst
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''
  license-files-extra: LICENSE fonts/LICENSE

config:
  install-commands:
  - |
    install -dm755 "%{install-root}%{datadir}/fonts/noto"
    find fonts -path '*/hinted/ttf/*.tt[fc]' \
      ! -name 'Noto*-Condensed*.ttf' \
      ! -name 'Noto*-Semi*.ttf' \
      ! -name 'Noto*-Extra*.ttf' \
      -exec install -Dm644 -t "%{install-root}%{datadir}/fonts/noto" {} +

sources:
- kind: git_repo
  url: github:notofonts/notofonts.github.io.git
  track: 'noto-monthly-release-*'
  ref: noto-monthly-release-2026.08.01-0-g113d8e66a13a47d514be6c07e616842258982f42
