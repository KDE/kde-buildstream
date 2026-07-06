#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>

set -eux

bst build \
    components/**.bst \
    os/**.bst \
    qt/**.bst
