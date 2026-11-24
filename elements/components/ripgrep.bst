# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/ripgrep/-/raw/main/PKGBUILD?ref_type=heads
kind: cargo

description: A search tool that combines the usability of ag with the raw speed of grep

build-depends:
- freedesktop-sdk.bst:bootstrap/stripper.bst
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/gcc.bst
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:BurntSushi/ripgrep.git
  track: '*'
  ref: 16.0.0-0-g669cb4c755db20b26c3af3d923c042ae224c7496
- kind: cargo2
  cargo-lock: Cargo.lock
  ref:
  - kind: registry
    name: aho-corasick
    version: 1.1.5
    sha: c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba
  - kind: registry
    name: anyhow
    version: 1.0.104
    sha: 330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470
  - kind: registry
    name: arbitrary
    version: 1.5.0
    sha: 3bc62ac97cc33321f50863d514c3bc38a453947a8f9e781137e47c7401020aed
  - kind: registry
    name: bstr
    version: 1.14.0
    sha: a680398c10c7bc0488067c4612226ea905a85f607134b69f3068d505d58c4214
  - kind: registry
    name: cc
    version: 1.11.3
    sha: 02f0e023adb368345ce0ca6cdfc0f24a06554468d0e8503e14a0841de79bfa69
  - kind: registry
    name: cfg-if
    version: 1.0.5
    sha: 4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600
  - kind: registry
    name: core_detect
    version: 1.0.0
    sha: 7f8f80099a98041a3d1622845c271458a2d73e688351bf3cb999266764b81d48
  - kind: registry
    name: crossbeam-channel
    version: 0.5.17
    sha: 98b0cc327b5bc766e7fda9c9260cc0fa81b43a8e240440422dff70788e3f9ef1
  - kind: registry
    name: crossbeam-deque
    version: 0.8.8
    sha: 622f3fc73690be383c7214310406f28a90e6edeadc3cea882f9d71e495b9711a
  - kind: registry
    name: crossbeam-epoch
    version: 0.9.21
    sha: dc74980687109a3b14c72fd458107bf0baa1da1a1a805e178d15501ba9b86d9d
  - kind: registry
    name: crossbeam-utils
    version: 0.8.23
    sha: a31eee39dddec8330830986fcd7625edb5a24ec90ea038215273bbc3adb08ac6
  - kind: registry
    name: derive_arbitrary
    version: 1.5.0
    sha: 1b034bd7d5f032402a2479444dcc6f74e36a03f31854d41680fb240ef682a1ac
  - kind: registry
    name: encoding_rs
    version: 0.8.44
    sha: 89253175e704ab869b04f9db224d38630e0211a53841a79181deae0889e169f5
  - kind: registry
    name: encoding_rs_io
    version: 0.1.8
    sha: fba3fe847045ecff794b9c138293a80db914678c453ad63fbf0c6a9eb6e00b22
  - kind: registry
    name: find-msvc-tools
    version: 0.1.15
    sha: 1c66915cc5391097de7a2b0b972e8505aa33c0df401fd3a6811dbdb32881ba48
  - kind: registry
    name: getrandom
    version: 0.4.3
    sha: 300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099
  - kind: registry
    name: glob
    version: 0.3.4
    sha: e4eba85ea1d0a966a983acd07deee566e67395d2d96b6fb39e62b5a833f1eb0b
  - kind: registry
    name: itoa
    version: 1.0.19
    sha: 3bd1574e617a9a6c1f8f8181bd7e841e1f20e4277607ef28945765188d6284d4
  - kind: registry
    name: jobserver
    version: 0.1.35
    sha: 1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3
  - kind: registry
    name: lexopt
    version: 0.3.2
    sha: 803ec87c9cfb29b9d2633f20cba1f488db3fd53f2158b1024cbefb47ba05d413
  - kind: registry
    name: libc
    version: 0.2.191
    sha: 65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a
  - kind: registry
    name: log
    version: 0.4.35
    sha: 5d15f86d12da44cd8d4ec3c73984537eb7f4cadcb9776a575a0a8a05ca11005c
  - kind: registry
    name: memchr
    version: 2.8.3
    sha: cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98
  - kind: registry
    name: memmap2
    version: 0.9.12
    sha: 6b0ca1155a9ecc25aa12e8313a119f32edf0255fea2f44839c4ac0a12b2ac157
  - kind: registry
    name: multiversion_no_op
    version: 1.0.0
    sha: 743fb55ba31b18fb1ecef6bdc9aa2743314978ac084044301a7eee33fb99a20d
  - kind: registry
    name: pcre2
    version: 0.2.11
    sha: 9e970b0fcce0c7ee6ef662744ff711f21ccd6f11b7cf03cd187a80e89797fc67
  - kind: registry
    name: pcre2-sys
    version: 0.2.10
    sha: 18b9073c1a2549bd409bf4a32c94d903bb1a09bf845bc306ae148897fa0760a4
  - kind: registry
    name: pkg-config
    version: 0.3.34
    sha: f6b464fbc74e149a392436b17d523f769e057cb6877f6a5c4618bc6f11800548
  - kind: registry
    name: proc-macro2
    version: 1.0.107
    sha: 985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9
  - kind: registry
    name: quote
    version: 1.0.47
    sha: 1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001
  - kind: registry
    name: r-efi
    version: 6.0.0
    sha: f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf
  - kind: registry
    name: regex
    version: 1.13.2
    sha: 9807af0e638c12e753aa1b4e601791bf2a8f71274023c8bbeec12fc149950857
  - kind: registry
    name: regex-automata
    version: 0.4.19
    sha: 41d60ef07df457506a0a1a2073112eb4aae5733dbd2813c3da77d1b0fd441158
  - kind: registry
    name: regex-syntax
    version: 0.8.12
    sha: d902046e6a28a1e4c3cab97258a0ce11e994903f01c2d97a9447a0b3df85f4f6
  - kind: registry
    name: rustversion
    version: 1.0.23
    sha: cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: serde
    version: 1.0.229
    sha: 4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba
  - kind: registry
    name: serde_core
    version: 1.0.229
    sha: 67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48
  - kind: registry
    name: serde_derive
    version: 1.0.229
    sha: e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348
  - kind: registry
    name: serde_json
    version: 1.0.154
    sha: e7e9cc8b1b85264074fbcc02a88680c4096b1e47df8f739dceb03bf482f04bd6
  - kind: registry
    name: shlex
    version: 2.0.1
    sha: f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba
  - kind: registry
    name: simdutf8
    version: 0.1.5
    sha: e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e
  - kind: registry
    name: syn
    version: 3.0.10
    sha: 4ae9ccbea3a7b0b09443036490c8f34a8b1b760fd345e5c0dae0aac718faea79
  - kind: registry
    name: termcolor
    version: 1.4.1
    sha: 06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755
  - kind: registry
    name: textwrap
    version: 0.16.4
    sha: 6ecfad6c3abc80a577f2b91c1e412ee57e7a060d430b553c1b0c940974ebcd49
  - kind: registry
    name: tikv-jemalloc-sys
    version: 0.7.1+5.3.1-0-g81034ce1f1373e37dc865038e1bc8eeecf559ce8
    sha: 1a2825c78386b4ae0314074867860ba9577875de945f05992c38815cbec327f0
  - kind: registry
    name: tikv-jemallocator
    version: 0.7.0
    sha: 249f09e49ab1609436f34c776e84231bead18d6a955f119f939bdc1d847561bd
  - kind: registry
    name: unicode-ident
    version: 1.0.27
    sha: a2c754d6c33795a1c324727428e5a7dedb5b06195f9890bdbcba760d3e246563
  - kind: registry
    name: walkdir
    version: 2.5.1
    sha: b42e295b7452c4604982280d8586001fcad9b8b201cac67bca9771e7a7475403
  - kind: registry
    name: winapi-util
    version: 0.1.11
    sha: c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22
  - kind: registry
    name: windows-link
    version: 0.2.1
    sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
  - kind: registry
    name: windows-sys
    version: 0.61.2
    sha: ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc
  - kind: registry
    name: zmij
    version: 1.0.23
    sha: 29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b
