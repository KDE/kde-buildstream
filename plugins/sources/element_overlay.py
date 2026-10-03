# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: LGPL-2.1-or-later
"""
element_overlay - modify an element in a staged junction
=========================================================

This source modifies an element file staged by earlier sources, typically in a
junction. It is a source plugin, not an element plugin.

**Usage:**

.. code:: yaml

   sources:
   - kind: element_overlay
     element: elements/hello.bst
     extra-config: files/overrides/hello.yml

``element`` is relative to the staged source directory, including the project's
element directory. ``extra-config`` names a YAML file in the parent project
containing only the changes to apply:

.. code:: yaml

   variables:
     message: A different message
   build-depends:
     (>):
     - new-depend.bst

It modifies the target element using BuildStream's usual YAML composition rules.
On lists, ``(>)`` can append to sequence values. Its contents are not expanded in the
parent project, so they may refer to variables defined by the project where it's used.
Other kinds of values will simply be replaced by their new overridden value.

Dependency names are resolved in the staged project: ``new-depend.bst`` must
exist there. Junction-qualified dependencies must also be reachable from that
project. This source does not make elements or junctions from the parent project
available to the staged project.

Local source paths are also resolved in the staged project. To add a file from
the parent project, first stage it into the junction with a ``local`` source,
then reference that staged path in the overlay. For example, the junction's
sources can contain:

.. code:: yaml

   sources:
   - kind: git_repo
     url: upstream:project.git
     ref: <commit>
   - kind: local
     path: files/custom-config.sh
     directory: files/downstream
   - kind: element_overlay
     element: elements/hello.bst
     extra-config: files/overrides/hello.yml

The parent project's ``files/overrides/hello.yml`` can then contain:

.. code:: yaml

   sources:
     (>):
     - kind: local
       path: files/downstream/custom-config.sh

The first ``local`` source copies the file into the junction's project; the
second copies it into the element's build sandbox. Likewise, a ``local`` source
on the junction can stage a new element into its element directory, making it
available to dependencies added by an overlay.
"""

import hashlib
from pathlib import Path

from buildstream import Source, SourceError
from ruamel.yaml import YAML, YAMLError


class ElementOverlaySource(Source):
    BST_MIN_VERSION = "2.5"
    BST_REQUIRES_PREVIOUS_SOURCES_STAGE = True

    def configure(self, node):
        node.validate_keys(
            Source.COMMON_CONFIG_KEYS
            + ["element", "extra-config", "dependency-slots"]
        )
        self.element_path = node.get_str("element")
        self.dependency_slots = node.get_str_list("dependency-slots", [])
        for path in self.dependency_slots:
            if Path(path).is_absolute() or ".." in Path(path).parts:
                raise SourceError(
                    f"Dependency slot must be a relative staged path: '{path}'",
                    reason="invalid-dependency-slot",
                )
        path = self.node_get_project_path(
            node.get_scalar("extra-config"), check_is_file=True
        )
        content = (Path(self.get_project_directory()) / path).read_bytes()
        self.override = self._load_mapping(content)
        self.override_digest = hashlib.sha256(content).hexdigest()

    def preflight(self):
        pass

    def get_unique_key(self):
        return [self.element_path, self.override_digest, self.dependency_slots]

    def is_resolved(self):
        return True

    def is_cached(self):
        return True

    def get_ref(self):
        return None

    def set_ref(self, ref, node):
        pass

    def fetch(self):
        pass

    def stage(self, directory):
        staging_root = Path(directory).resolve()
        target = (staging_root / self.element_path).resolve()
        if not target.is_relative_to(staging_root) or not target.is_file():
            raise SourceError(
                "element must refer to a regular file inside the staged source: "
                "'{}'".format(self.element_path),
                reason="invalid-element-path",
            )

        original_content = target.read_bytes()
        override = self.override.copy()
        kind = override.get("kind") or self._load_mapping(
            original_content
        ).get("kind")
        if not isinstance(kind, str) or kind in ("junction", "link"):
            raise SourceError(
                "element must declare a kind supporting includes: '{}'".format(
                    self.element_path
                ),
                reason="unsupported-element-kind",
            )

        for path in self.dependency_slots:
            slot = (staging_root / path).resolve()
            if not slot.is_relative_to(staging_root) or slot == staging_root:
                raise SourceError(
                    f"Dependency slot must be inside the staged source: '{path}'",
                    reason="invalid-dependency-slot",
                )
            slot.parent.mkdir(parents=True, exist_ok=True)
            try:
                with slot.open("x") as stream:
                    stream.write("kind: stack\n")
            except FileExistsError as error:
                raise SourceError(
                    f"Dependency slot already exists: '{path}'",
                    reason="dependency-slot-exists",
                ) from error

        index = 0
        while True:
            includes = target.parent / (".element-overlay-{}".format(index))
            try:
                includes.mkdir()
                break
            except FileExistsError:
                index += 1

        original = includes / "original.yml"
        original.write_bytes(original_content)

        existing_include = override.get("(@)", [])
        if isinstance(existing_include, str):
            existing_include = [existing_include]
        existing_include.append(original.relative_to(staging_root).as_posix())
        override["(@)"] = existing_include
        override["kind"] = kind

        YAML(typ="safe").dump(override, target)

    @staticmethod
    def _load_mapping(content):
        try:
            value = YAML(typ="base").load(content)
        except YAMLError as error:
            raise SourceError(
                "Invalid element configuration: {}".format(error),
                reason="invalid-yaml",
            ) from error
        if not isinstance(value, dict):
            raise SourceError(
                "Element configuration must be a YAML mapping",
                reason="invalid-yaml",
            )
        return value


def setup():
    return ElementOverlaySource
