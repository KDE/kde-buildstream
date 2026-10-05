# SPDX-FileCopyrightText: 2018 freedesktop-sdk
# SPDX-License-Identifier: MIT
# Adapted from freedesktop-sdk-docker-images.

kind: pyproject
build-depends:
- freedesktop-sdk.bst:components/python3-hatch-fancy-pypi-readme.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
depends:
- freedesktop-sdk.bst:components/python3.bst
- components/python3-annotated-types.bst
- components/python3-pydantic-core.bst
- components/python3-typing-inspection.bst
- freedesktop-sdk.bst:components/python3-typing-extensions.bst
variables:
  strip-binaries: ''
sources:
- kind: tar
  url: https://files.pythonhosted.org/packages/18/a5/b60d21ac674192f8ab0ba4e9fd860690f9b4a6e51ca5df118733b487d8d6/pydantic-2.13.4.tar.gz
  ref: c40756b57adaa8b1efeeced5c196f3f3b7c435f90e84ea7f443901bec8099ef6
- kind: patch
  path: patches/python3-pydantic/require-deps.patch
