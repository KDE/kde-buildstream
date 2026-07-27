<!--
SPDX-License-Identifier: CC0-1.0
SPDX-FileCopyrightText: 2026 Harald Sitter <sitter@kde.org>
-->

# KDE Buildstream

These are KDE's buildstream elements as well as modifications on top of the freedesktop-sdk.
When looking for an element source, or wanting to add one, this should probably be your first stop.

## freedesktop-sdk patch_queue

Of special note is `patches/freedesktop-sdk/`. It contains a patch queue for freedesktop-sdk to apply modifications that
cannot be otherwise made at this time. To work with this patch queue you can perhaps best follow this snippet

```sh
git clone --depth 20 https://gitlab.com/freedesktop-sdk/freedesktop-sdk.git
cd freedesktop-sdk
git am ../patches/freedesktop-sdk/*
# Make your changes **to the relevant commits or add a new one**
git format-patch origin/master # generate new patch queue
cp *.patch ../patches/freedesktop-sdk/
```
