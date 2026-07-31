#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Aleix Pol i Gonzalez <aleix.pol@codethink.co.uk>

set -eux

sdk_sources=$(mktemp -d)
trap 'rm -rf "$sdk_sources"' EXIT
bst source checkout --directory "$sdk_sources" freedesktop-sdk.bst

rm -rf manifest/
bst build manifests/manifest.bst
bst artifact checkout manifests/manifest.bst --directory manifest/

sh utils/generate-spdx-sbom-report.sh kde-buildstream --spdx-comment "KDE BuildStream" --deps all os/deps.bst
cp sbom-reports/kde-buildstream.spdx.json manifest/usr/manifest.spdx.json
python3 "$sdk_sources/freedesktop-sdk/utils/spdxtomd.py" manifest/usr/manifest.spdx.json
