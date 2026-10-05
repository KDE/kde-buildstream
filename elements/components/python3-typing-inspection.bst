# SPDX-FileCopyrightText: 2018 freedesktop-sdk
# SPDX-License-Identifier: MIT
# Adapted from freedesktop-sdk-docker-images.

kind: pyproject
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
depends:
- freedesktop-sdk.bst:components/python3-typing-extensions.bst
variables:
  strip-binaries: ''
sources:
- kind: git_repo
  url: https://github.com/pydantic/typing-inspection.git
  track: v*
  ref: v0.4.2-0-g8db011350942f33ac4b5d7db60d4d9ea83ab480f
