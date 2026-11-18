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
  ref: v2.7.0-0-g756cd453d7afe69fd2a00a7592fd2d9869a6f756
- kind: go_mod_vendor
  ref:
  - module: github.com/aperturerobotics/jacobsa-crypto
    version: v1.1.0
    sha256sum: 09ffc50b4758a62e66a30f7403238512e83129676bc7d1a7d747b25ea101822f
  - module: github.com/davecgh/go-spew
    version: v1.1.0
    sha256sum: 0b5a691aeb8b6af31bd2bb640973ea7e8bf1ed9bc5889da220bf44dc06d9692c
  - module: github.com/hanwen/go-fuse/v2
    version: v2.12.1-0.20261018182834-2d50fff207d7
    sha256sum: 36c636fdcff1b570b10cfd68cdd02e32be67614688e0a9560508fc582c55c049
  - module: github.com/jacobsa/oglematchers
    version: v0.0.0-20150720000706-141901ea67cd
    sha256sum: bcd70357107c45c3177c913b718624376b692d39672c157708fe2cd9aa78fcb5
  - module: github.com/jacobsa/oglemock
    version: v0.0.0-20150831005832-e94d794d06ff
    sha256sum: 5159f5f22d0e130b1fbfdbc96eb9d4653b32bd463439cb0f3c98e179de5daf80
  - module: github.com/jacobsa/ogletest
    version: v0.0.0-20170503003838-80d50a735a11
    sha256sum: 69d96e3ea6e055d68ed46c0c1044a5dfa18064c9d45bc68d5946aa55e048af6b
  - module: github.com/jacobsa/reqtrace
    version: v0.0.0-20150505043853-245c9e0234cb
    sha256sum: a7efb54142e39f4acab39d22db692d5734f818723783646f6727269228deea83
  - module: github.com/kylelemons/godebug
    version: v1.1.0
    sha256sum: dbbd0ce8c2f4932bb03704d73026b21af12bd68d5b8f4798dbf10a487a2b6d13
  - module: github.com/moby/sys/mountinfo
    version: v0.7.2
    sha256sum: 94f79687bc3b72ca4cc60fafda851454fefc0ef04bdb4499e8c7c2b2e231b5d3
  - module: github.com/pkg/xattr
    version: v0.4.9
    sha256sum: 03aa1ce578e02548201e7099bd53bd18a56d8cd7ae44bb7d8ab9457a5fb34b06
  - module: github.com/pmezard/go-difflib
    version: v1.0.0
    sha256sum: de04cecc1a4b8d53e4357051026794bcbc54f2e6a260cfac508ce69d5d6457a0
  - module: github.com/rfjakob/eme
    version: v1.2.0
    sha256sum: e233157a745ba698a268b6b6630e923286b550a0caaeb8849b03f30841ed4dd0
  - module: github.com/sabhiram/go-gitignore
    version: v0.0.0-20210923224102-525f6e181f06
    sha256sum: 18379d4fa60ed3050b651e51ecb48a21aba3bf951c81d359aadbc1d7601ffef5
  - module: github.com/spf13/pflag
    version: v1.0.10
    sha256sum: a246b8c9d3daa87d6c634cdfee1bdf7fa53d5817eeef4fa0c6da43edd12de4ca
  - module: github.com/stretchr/testify
    version: v1.6.1
    sha256sum: e3c77324195658ead0289c507966fec55c69a7b1b8e3aac13c587dc50932fbc3
  - module: golang.org/x/crypto
    version: v0.58.0
    sha256sum: b0a45594cda20ddb4264d84aeff9b588b8570bf6a2833c51a0b821734a298d95
  - module: golang.org/x/net
    version: v0.54.0
    sha256sum: 1fef7f3ac7fc69f85b7fa47df036c75ad2136f719072a2bb4b93fc79f90bc7c7
  - module: golang.org/x/net
    version: v0.60.0
    sha256sum: 052e0453db47a96ae9567503e7c95ea925ab52682cb1cec31250541f7160107e
  - module: golang.org/x/sys
    version: v0.49.0
    sha256sum: e73a06591ca0d7016ce3ccb45c36a8ed7128468aecc1a357f94d815c760c6b31
  - module: golang.org/x/term
    version: v0.47.0
    sha256sum: d990d5ab94dfa41ba980645b721bba7490064337a01bb03e6cacace70e8df0bf
  - module: golang.org/x/text
    version: v0.43.0
    sha256sum: b75131f628f6e2e4892fd638d33127e952a5027775e0162b94ba069cb4e13863
  - module: gopkg.in/yaml.v3
    version: v3.0.0-20200313102051-9f266ea9e77c
    sha256sum: acf19ccb4fca983b234a39ef032faf9ab70e759680673bb3dff077e77fee20fe
