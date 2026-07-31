#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Aleix Pol i Gonzalez <aleix.pol@codethink.co.uk>

set -eux

wget -O utils/jsontomd.py https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/raw/master/utils/jsontomd.py

rm -rf manifest/
bst build manifests/manifest.bst
bst artifact checkout manifests/manifest.bst --directory manifest/

python3 utils/jsontomd.py manifest/usr/manifest.json
