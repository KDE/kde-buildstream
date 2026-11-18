# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Hadi Chokr <hadichokr@icloud.com>

# python3 -m unittest discover tools

import contextlib
import importlib.util
import io
import os
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

spec = importlib.util.spec_from_file_location("check", Path(__file__).with_name("check-missing-deps.py"))
check = importlib.util.module_from_spec(spec)
spec.loader.exec_module(check)


class Missing(unittest.TestCase):
    def test_find_package(self):
        self.assertEqual(check.missing("-- Could NOT find LibEdit (missing: LibEdit_INCLUDE_DIRS)"), {"LibEdit"})
        self.assertEqual(check.missing('-- Could NOT find LibGit2: Found unsuitable version "1.1"'), {"LibGit2"})

    def test_config_file(self):
        self.assertEqual(check.missing('Could not find a package configuration file provided by "KF6Wallet" with any'),
                         {"KF6Wallet"})

    def test_pkg_config(self):
        self.assertEqual(check.missing("--   No package 'libcanberra' found"), {"libcanberra"})
        log = "--   No package 'libfoo' found\n--   Found libfoo, version 1.0"
        self.assertEqual(check.missing(log), set())

    def test_feature_summary(self):
        log = """-- The following packages have been found:
 * Qt6Core
-- The following OPTIONAL packages have not been found:

 * Qt6TextToSpeech, Qt text to speech, <https://qt.io>
   Needed for speech
 * PCSC

-- Configuring done (1.2s)
 * NotInASummary"""
        self.assertEqual(check.missing(log), {"Qt6TextToSpeech", "PCSC"})

    def test_meson(self):
        log = """Run-time dependency libsystemd found: NO (tried pkgconfig and cmake)
Dependency glib-2.0 found: NO found 2.78.0 but need: '>= 2.80'
Library bsd found: NO
Library m found: YES
Program python3 (louis) found: NO
Dependency gtk4 skipped: feature gtk disabled"""
        self.assertEqual(check.missing(log), {"libsystemd", "glib-2.0", "bsd", "python3 (louis)"})

    def test_found_later(self):
        log = """Could not find a package configuration file provided by "LibXml2" with any
-- Found LibXml2: /usr/lib/libxml2.so (found version "2.13")
Dependency libjpeg found: NO tried pkgconfig
Dependency LIBJPEG found: YES 3.0 (cached)"""
        self.assertEqual(check.missing(log), set())

    def test_subproject(self):
        log = """Run-time dependency libcdvar-1 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency libcdvar-1"""
        self.assertEqual(check.missing(log), set())

    def test_test_and_doc_tools(self):
        self.assertEqual(check.missing("-- Could NOT find Doxygen (missing: DOXYGEN_EXECUTABLE)\n"
                                       "Program valgrind found: NO"), set())


class Project(unittest.TestCase):
    """Runs main() in a fake project with fake bst logs."""

    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp())
        self.addCleanup(lambda: __import__("shutil").rmtree(self.tmp))
        (self.tmp / "project.conf").write_text("name: proj\nelement-path: elements\n")
        for element, kind in (("components/foo.bst", "cmake"), ("components/sub/bar.bst", "meson"),
                              ("qt/baz.bst", "cmake"), ("components/fdsdk.bst", "junction")):
            path = self.tmp / "elements" / element
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(f"kind: {kind}\n")
        self.logs = self.tmp / "logs"
        self.log("components-foo", "a-build.1.log", "-- Could NOT find Old", mtime=0)
        self.log("components-foo", "b-build.2.log", "-- Could NOT find Bar\n-- Could NOT find Baz")
        self.log("components-foo", "c-pull.3.log", "-- Could NOT find FromPull")
        self.log("components-sub-bar", "a-build.1.log", "Dependency systemd found: NO")
        self.log("qt-baz", "a-build.1.log", "-- Could NOT find Anything")

    def log(self, directory, name, text, mtime=None):
        path = self.logs / "proj" / directory / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text)
        if mtime is not None:
            os.utime(path, (mtime, mtime))

    def run_main(self, allowlist, *args):
        (self.tmp / "missing-deps.yml").write_text(allowlist)
        out, err = io.StringIO(), io.StringIO()
        cwd = os.getcwd()
        os.chdir(self.tmp)
        try:
            with mock.patch.object(check, "LOG_ROOT", self.logs), mock.patch.object(sys, "argv", ["x", *args]), \
                    contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
                ret = check.main()
        finally:
            os.chdir(cwd)
        return ret, out.getvalue(), err.getvalue()

    def test_newest_build_log_of_targets_only(self):
        ret, out, err = self.run_main("", "components/**.bst")
        self.assertEqual(ret, 1)
        self.assertEqual(out.splitlines(), ["components/foo.bst: missing Bar", "components/foo.bst: missing Baz",
                                            "components/sub/bar.bst: missing systemd"])

    def test_allowlist(self):
        allowlist = "components/foo.bst:\n- bar\n- Baz\n- Gone\ncomponents/sub/bar.bst:\n- '*'\nnope.bst:\n- X\n"
        ret, out, err = self.run_main(allowlist, "components/**.bst")
        self.assertEqual((ret, out), (0, ""))
        self.assertIn("components/foo.bst: Gone isn't missing anymore", err)
        self.assertIn("nope.bst doesn't exist", err)

    def test_not_built_here(self):
        self.log("components-foo", "a-build.1.log", "")
        ret, out, err = self.run_main("", "qt/*.bst", "components/sub/*.bst")
        self.assertIn("components/sub/bar.bst: missing systemd", out)
        self.assertNotIn("foo", out)

    def test_print(self):
        ret, out, err = self.run_main("", "--print", "components/**.bst")
        self.assertEqual(ret, 0)
        self.assertEqual(check.yaml.load(out),
                         {"components/foo.bst": ["Bar", "Baz"], "components/sub/bar.bst": ["systemd"]})


if __name__ == "__main__":
    unittest.main()
