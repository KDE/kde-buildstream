# SPDX-FileCopyrightText: 2018 freedesktop-sdk
# SPDX-License-Identifier: MIT
# Adapted from freedesktop-sdk-docker-images.

kind: pyproject
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
depends:
- freedesktop-sdk.bst:components/python3.bst
variables:
  strip-binaries: ''
sources:
- kind: tar
  url: https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz
  ref: aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89
