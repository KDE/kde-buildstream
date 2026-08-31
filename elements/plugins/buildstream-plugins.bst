# SPDX-FileCopyrightText: 2025 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: BSD-2-Clause

kind: junction
sources:
- kind: git_repo
  url: github:apache/buildstream-plugins.git
  track: "*.*.*"
  exclude:
  - "*dev*"
  ref: 2.8.0-0-g2681232038711d5c3d4ef1ecc962321c33ec72c1
