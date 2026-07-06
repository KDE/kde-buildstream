#!/bin/sh
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>

set -eux

if [ "$KDECI_BUILD" != "TRUE" ]; then
    exit 0
fi

sudo pacman --sync --refresh --noconfirm lzip # lzip needed by the gettext element

python3 -m venv .venv --system-site-packages
. .venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install 'BuildStream>=2.7' dulwich tomlkit

[ -d ~/.config ] || mkdir ~/.config
cp buildstream.conf.writable ~/.config/buildstream.conf
set +x
echo "$BST_CACHE_TOKEN" > /tmp/bst-cache-token
set -x
