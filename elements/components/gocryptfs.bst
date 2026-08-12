# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

description: Encrypted overlay filesystem written in Go.

build-depends:
- freedesktop-sdk.bst:components/git.bst
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:components/fuse3.bst
- freedesktop-sdk.bst:components/openssl.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  # The standard make command will pull pandoc as a dependency which needs all of haskell. Just build the program.
  build-commands:
  - ./build.bash
  install-commands:
  # Git tags do not contain the rendered manpages expected by `make install`.
  - install -Dm755 -t "%{install-root}%{bindir}" gocryptfs gocryptfs-xray/gocryptfs-xray
  - install -Dm644 -t "%{install-root}%{datadir}/licenses/gocryptfs" LICENSE

sources:
- kind: git_repo
  url: github:rfjakob/gocryptfs.git
  track: 'v*.*.*'
  ref: v2.6.1-0-g25e85a4454e93643ad92397d01ed532a360d7ee2
- kind: go_module
  url: github:aperturerobotics/jacobsa-crypto.git
  module: github.com/aperturerobotics/jacobsa-crypto
  ref:
    go-version: v1.1.0
    git-ref: v1.1.0-0-gaf52270f8fe6132d8077b33e515ec4f8c542980d
    explicit: True
- kind: go_module
  url: github:davecgh/go-spew.git
  module: github.com/davecgh/go-spew
  ref:
    go-version: v1.1.0
    git-ref: v1.1.0-0-g346938d642f2ec3594ed81d874461961cd0faa76
    explicit: False
- kind: go_module
  url: github:hanwen/go-fuse.git
  module: github.com/hanwen/go-fuse/v2
  ref:
    go-version: v2.8.0
    git-ref: v2.8.0-0-gee34567408d6ab557a0169089879ec111bd74408
    explicit: True
- kind: go_module
  url: github:jacobsa/oglematchers.git
  module: github.com/jacobsa/oglematchers
  ref:
    go-version: v0.0.0-20150720000706-141901ea67cd
    git-ref: 141901ea67cd4769c6800aa7bfdfc558fa22bda5
    explicit: False
- kind: go_module
  url: github:jacobsa/oglemock.git
  module: github.com/jacobsa/oglemock
  ref:
    go-version: v0.0.0-20150831005832-e94d794d06ff
    git-ref: e94d794d06ffc6de42cb19d0dab3c219efdd6dcf
    explicit: False
- kind: go_module
  url: github:jacobsa/ogletest.git
  module: github.com/jacobsa/ogletest
  ref:
    go-version: v0.0.0-20170503003838-80d50a735a11
    git-ref: 80d50a735a1108a2aeb7abc4a988d183f20c5292
    explicit: False
- kind: go_module
  url: github:jacobsa/reqtrace.git
  module: github.com/jacobsa/reqtrace
  ref:
    go-version: v0.0.0-20150505043853-245c9e0234cb
    git-ref: 245c9e0234cb2ad542483a336324e982f1a22934
    explicit: False
- kind: go_module
  url: github:kylelemons/godebug.git
  module: github.com/kylelemons/godebug
  ref:
    go-version: v1.1.0
    git-ref: v1.1.0-0-g9ff306d4fbead574800b66369df5b6144732d58e
    explicit: False
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/mountinfo
  ref:
    go-version: v0.7.2
    git-ref: mountinfo/v0.7.2-0-gcafbe42351600ca9b363e220722f66d96f6e71f4
    explicit: True
    subdirectory: mountinfo
- kind: go_module
  url: github:pkg/xattr.git
  module: github.com/pkg/xattr
  ref:
    go-version: v0.4.9
    git-ref: v0.4.9-0-g87ba458273dc4e1cfef4d6d43faffdcf7e9077be
    explicit: True
- kind: go_module
  url: github:pmezard/go-difflib.git
  module: github.com/pmezard/go-difflib
  ref:
    go-version: v1.0.0
    git-ref: v1.0.0-0-g792786c7400a136282c1664665ae0a8db921c6c2
    explicit: False
- kind: go_module
  url: github:rfjakob/eme.git
  module: github.com/rfjakob/eme
  ref:
    go-version: v1.1.2
    git-ref: v1.1.2-0-gf867e203db5dfe7d05a58a59e9042e864b1eb19e
    explicit: True
- kind: go_module
  url: github:sabhiram/go-gitignore.git
  module: github.com/sabhiram/go-gitignore
  ref:
    go-version: v0.0.0-20210923224102-525f6e181f06
    git-ref: 525f6e181f062064d83887ed2530e3b1ba0bc95a
    explicit: True
- kind: go_module
  url: github:spf13/pflag.git
  module: github.com/spf13/pflag
  ref:
    go-version: v1.0.5
    git-ref: v1.0.5-0-g2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab
    explicit: True
- kind: go_module
  url: github:stretchr/testify.git
  module: github.com/stretchr/testify
  ref:
    go-version: v1.6.1
    git-ref: v1.6.1-0-gf654a9112bbeac49ca2cd45bfbe11533c4666cf8
    explicit: False
- kind: go_module
  url: github:golang/crypto.git
  module: golang.org/x/crypto
  ref:
    go-version: v0.33.0
    git-ref: v0.33.0-0-g9290511cd23ab9813a307b7f2615325e3ca98902
    explicit: True
- kind: go_module
  url: github:golang/net.git
  module: golang.org/x/net
  ref:
    go-version: v0.21.0
    git-ref: v0.21.0-0-g73d21fdbb4d7dc7115b50526b93b6c37a4e3377f
    explicit: False
- kind: go_module
  url: github:golang/sys.git
  module: golang.org/x/sys
  ref:
    go-version: v0.30.0
    git-ref: v0.30.0-0-g863b3c4ac4975ff758815fa8d01acb6771f37177
    explicit: True
- kind: go_module
  url: github:golang/term.git
  module: golang.org/x/term
  ref:
    go-version: v0.29.0
    git-ref: v0.29.0-0-g743b2709ab25357d30ce1eac4a840eb0b7deb1bf
    explicit: True
- kind: go_module
  url: https://gopkg.in/yaml.v3
  module: gopkg.in/yaml.v3
  ref:
    go-version: v3.0.0-20200313102051-9f266ea9e77c
    git-ref: 9f266ea9e77c4c7aab4cf02650570e7c7b3031a5
    explicit: False
