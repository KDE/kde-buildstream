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
- kind: go_mod_vendor
  ref:
  - module: github.com/aperturerobotics/jacobsa-crypto
    version: v1.1.0
    sha256sum: 09ffc50b4758a62e66a30f7403238512e83129676bc7d1a7d747b25ea101822f
  - module: github.com/davecgh/go-spew
    version: v1.1.0
    sha256sum: 0b5a691aeb8b6af31bd2bb640973ea7e8bf1ed9bc5889da220bf44dc06d9692c
  - module: github.com/hanwen/go-fuse/v2
    version: v2.8.0
    sha256sum: ac0a357028e533e764cb25fd359e18e867a0bca09adaef79245658399797d56c
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
    version: v1.1.2
    sha256sum: 6187089d5d40720c5cfeb4814d735d4b23a038f7da6406f088b83907781f4b57
  - module: github.com/sabhiram/go-gitignore
    version: v0.0.0-20210923224102-525f6e181f06
    sha256sum: 18379d4fa60ed3050b651e51ecb48a21aba3bf951c81d359aadbc1d7601ffef5
  - module: github.com/spf13/pflag
    version: v1.0.5
    sha256sum: fc6e704f2f6a84ddcdce6de0404e5340fa20c8676181bf5d381b17888107ba84
  - module: github.com/stretchr/testify
    version: v1.6.1
    sha256sum: e3c77324195658ead0289c507966fec55c69a7b1b8e3aac13c587dc50932fbc3
  - module: golang.org/x/crypto
    version: v0.33.0
    sha256sum: 3b0c19c1d259e93464f540165470de872721e5fc66ce3f0d36ffd27d307ec5bb
  - module: golang.org/x/net
    version: v0.21.0
    sha256sum: 4e9cb4bded1957e73fe709741c29879eab05047617c9b14b7237314ff9024913
  - module: golang.org/x/sys
    version: v0.30.0
    sha256sum: f5214bfec98f00e5432da68bbece03e98600fa41594ed026556cbde8fcb6f7c9
  - module: golang.org/x/term
    version: v0.29.0
    sha256sum: 9d92c583d222113ac653848b3319ff559d2dba92f8232baff03d08fc9c0b8619
  - module: gopkg.in/yaml.v3
    version: v3.0.0-20200313102051-9f266ea9e77c
    sha256sum: acf19ccb4fca983b234a39ef032faf9ab70e759680673bb3dff077e77fee20fe
