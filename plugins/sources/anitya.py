# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

"""Track and stage release archives listed by release-monitoring.org."""

import posixpath
import tarfile

import requests
from buildstream import DownloadableFileSource, Node, Source, SourceError


class AnityaSource(DownloadableFileSource):
    BST_MIN_VERSION = "2.5"

    API_URL = "https://release-monitoring.org/api/v2/"
    KEYS = ["project-id", "url", "ref"] + Source.COMMON_CONFIG_KEYS

    def configure(self, node):
        node.validate_keys(self.KEYS)

        self.project_id = node.get_int("project-id")
        self.url_template = node.get_str("url")

        self.version = None
        self.ref = None
        self.load_ref(node)

    def load_ref(self, node):
        ref = node.get_mapping("ref", None)
        if ref is not None:
            ref.validate_keys(["version", "sha256sum"])
            ref = {
                "version": ref.get_str("version"),
                "sha256sum": ref.get_str("sha256sum"),
            }
        self._apply_ref(ref)

    def get_ref(self):
        if self.version is None or self.ref is None:
            return None
        return {"version": self.version, "sha256sum": self.ref}

    def set_ref(self, ref, node):
        if ref is None:
            if "ref" in node:
                del node["ref"]
        else:
            node["ref"] = ref
        self._apply_ref(ref)

    def _apply_ref(self, ref):
        self.version = ref["version"] if ref is not None else None
        self.ref = ref["sha256sum"] if ref is not None else None
        self._set_version(self.version)

    def track(self):
        versions = self._get_versions()
        if not versions:
            raise SourceError(f"Anitya project {self.project_id} has no versions")
        version = versions[0]

        self.ref = None
        self._set_version(version)
        sha256sum = self._ensure_mirror(f"Tracking {self.url}")

        return {"version": version, "sha256sum": sha256sum}

    def stage(self, directory):
        try:
            with tarfile.open(self._get_mirror_file(), "r:*") as archive:
                members = archive.getmembers()
                paths = [posixpath.normpath(member.name) for member in members]
                paths = [path for path in paths if path != "."]
                root = posixpath.commonpath(paths).split("/", 1)[0]
                prefix = root + "/"
                if root in ("", ".", ".."):
                    raise SourceError(
                        "Release archive must contain one top-level directory"
                    )

                staged = []
                for member in members:
                    path = posixpath.normpath(member.name)
                    if path == root:
                        continue

                    member.name = path.removeprefix(prefix)
                    if member.islnk():
                        member.linkname = posixpath.normpath(
                            member.linkname
                        ).removeprefix(prefix)
                    staged.append(member)

                archive.extractall(directory, members=staged, filter="data")
        except (ValueError, tarfile.TarError, OSError) as error:
            raise SourceError(f"Error staging {self.url}: {error}") from error

    def _render_url(self, url, version):
        if version is None:
            return url

        values = dict(zip(("major", "minor", "patch"), version.split(".")))
        values["version"] = version
        return url.format(**values)

    def _set_version(self, version):
        self.version = version
        config = {"url": self._render_url(self.url_template, version)}
        if self.ref is not None:
            config["ref"] = self.ref
        if version is not None:
            config["version"] = version
        super().configure(Node.from_dict(config))

    def _get_versions(self):
        try:
            response = requests.get(
                self.API_URL + "versions/",
                params={"project_id": self.project_id},
                timeout=60,
            )
            response.raise_for_status()
            return response.json().get("stable_versions", [])
        except requests.RequestException as error:
            raise SourceError(str(error), temporary=True) from error


def setup():
    return AnityaSource
