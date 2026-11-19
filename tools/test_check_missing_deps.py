# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>

# python3 -m unittest discover tools

import contextlib
import importlib.util
import io
import os
import shutil
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

TOOLS = Path(__file__).parent
FIXTURES = TOOLS / "fixtures"

spec = importlib.util.spec_from_file_location("check", TOOLS / "check-missing-deps.py")
check = importlib.util.module_from_spec(spec)
spec.loader.exec_module(check)


def missing(fixture):
    return check.missing((FIXTURES / "logs" / fixture).read_text())


class Missing(unittest.TestCase):
    def test_find_package(self):
        self.assertEqual(missing("find-package.log"), {"LibEdit", "LibGit2"})

    def test_config_file(self):
        self.assertEqual(missing("config-file.log"), {"KF6Wallet"})

    def test_pkg_config(self):
        self.assertEqual(missing("pkg-config.log"), {"libcanberra"})

    def test_feature_summary(self):
        self.assertEqual(missing("feature-summary.log"), {"Qt6TextToSpeech", "PCSC"})

    def test_meson(self):
        self.assertEqual(missing("meson.log"), {"libsystemd", "glib-2.0", "bsd", "python3 (louis)"})

    def test_found_later(self):
        self.assertEqual(missing("found-later.log"), set())

    def test_subproject(self):
        self.assertEqual(missing("subproject.log"), set())

    def test_test_and_doc_tools(self):
        self.assertEqual(missing("test-tools.log"), set())


class Project(unittest.TestCase):
    """Runs main() on a copy of fixtures/project, which has bst style logs in logs/."""

    def setUp(self):
        tmp = tempfile.mkdtemp()
        self.addCleanup(shutil.rmtree, tmp)
        self.project = Path(tmp) / "project"
        shutil.copytree(FIXTURES / "project", self.project)
        # git doesn't keep mtimes, make the first build of foo the older one
        os.utime(self.project / "logs/proj/components-foo/f00f00f0-build.1.log", (0, 0))
        # what `bst show` reports, the junction isn't there
        self.keys = {"components/foo.bst": "f00f00f0" + "0" * 56, "components/sub/bar.bst": "ba5ba5ba" + "0" * 56,
                     "qt/baz.bst": "ba2ba2ba" + "0" * 56}

    def run_main(self, *args, allowlist=""):
        if allowlist is not None:
            (self.project / "missing-deps.yml").write_text(allowlist)
        out, err = io.StringIO(), io.StringIO()
        cwd = os.getcwd()
        os.chdir(self.project)
        try:
            with mock.patch.object(check, "LOG_ROOT", self.project / "logs"), \
                    mock.patch.object(sys, "argv", ["x", *args]), \
                    mock.patch.object(check, "cache_keys", lambda targets: self.keys), \
                    contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
                ret = check.main()
        finally:
            os.chdir(cwd)
        return ret, out.getvalue(), err.getvalue()

    def test_newest_build_log_of_targets_only(self):
        ret, out, err = self.run_main("components/**.bst")
        self.assertEqual(ret, 1)
        self.assertEqual(out.splitlines(), ["components/foo.bst: missing Bar", "components/foo.bst: missing Baz",
                                            "components/sub/bar.bst: missing systemd"])

    def test_allowlist(self):
        ret, out, err = self.run_main("components/**.bst", allowlist=None)  # the fixture's missing-deps.yml
        self.assertEqual((ret, out), (0, ""))
        self.assertIn("components/foo.bst: Gone isn't missing anymore", err)
        self.assertIn("nope.bst doesn't exist", err)

    def test_only_targets(self):
        ret, out, err = self.run_main("qt/*.bst", "components/sub/*.bst")
        self.assertIn("components/sub/bar.bst: missing systemd", out)
        self.assertNotIn("foo", out)

    def test_stale_logs_are_ignored(self):
        self.keys["qt/baz.bst"] = "11111111" + "0" * 56  # pulled from the cache at a newer key
        ret, out, err = self.run_main("qt/*.bst")
        self.assertEqual((ret, out), (0, ""))
        self.assertIn("skipped 1 elements", err)

    def test_cache_keys(self):
        show = "components/foo.bst f00\nqt/baz.bst ba2\n[--:--:--] some bst noise\n"
        with mock.patch.object(check.subprocess, "run", return_value=mock.Mock(stdout=show)) as run:
            self.assertEqual(check.cache_keys(["components/**.bst"]), {"components/foo.bst": "f00", "qt/baz.bst": "ba2"})
        self.assertEqual(run.call_args.args[0][-1], "components/**.bst")

    def test_print(self):
        ret, out, err = self.run_main("--print", "components/**.bst")
        self.assertEqual(ret, 0)
        self.assertEqual(check.yaml.load(out),
                         {"components/foo.bst": ["Bar", "Baz"], "components/sub/bar.bst": ["systemd"]})


if __name__ == "__main__":
    unittest.main()
