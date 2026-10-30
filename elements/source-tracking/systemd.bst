# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Track the shared source used by systemd in the SDK junction. Do not build or include anywhere.
kind: import

(@):
- include/sources/systemd.yml
