# SPDX-FileCopyrightText: 2025 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction

sources:
- kind: git_repo
  url: https://gitlab.com/freedesktop-sdk/freedesktop-sdk.git
  track: master # we need to track master because we bring dependencies from there
  ref: freedesktop-sdk-25.08rc.3-2246-g55756d1b8f2488b33f88bd1e6f466a4a9583c441

config:
  options:
    target_arch: '%{arch}'
    (?):
    - arch in ('x86_64', 'i686'):
        bootstrap_build_arch: 'x86_64'
    - arch in ('aarch64', 'arm'):
        bootstrap_build_arch: 'aarch64'
    - arch == "riscv64":
        bootstrap_build_arch: "x86_64"
