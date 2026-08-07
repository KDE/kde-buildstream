#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Aleix Pol i Gonzalez <aleix.pol@codethink.co.uk>

set -eux

name=$1
shift

buildstream-sbom \
    --spdx-name $name \
    --spdx-namespace https://linux.kde.org/spdxdocs/$name.spdx.json-${UUID-$name} \
    --output "sbom-reports" "$@"
