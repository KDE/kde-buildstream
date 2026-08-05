# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: import

description: Start nvidia-persistenced only when an NVIDIA GPU device exists

sources:
- kind: local
  path: files/nvidia-persistenced

config:
  target: '%{indep-libdir}/systemd/system/nvidia-persistenced.service.d'
