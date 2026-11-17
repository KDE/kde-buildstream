# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/rust.bst
- components/corrosion.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- freedesktop-sdk.bst:components/sqlite.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

environment:
  CARGO_NET_OFFLINE: 'true'

sources:
- kind: git_repo
  url: github:chewing/libchewing.git
  track: 'v*'
  ref: v0.12.0-alpha.1-0-g537380ad1b1c47c7e29d24c5d9174b4dcd86e816
- kind: git_module
  url: github:chewing/libchewing-data.git
  path: data
  ref: ea74f76dd2548b1d65d0ff70c3ae66057a6ad97d
- kind: cargo2
  cargo-lock: Cargo.lock
  ref:
  - kind: registry
    name: aho-corasick
    version: 1.1.4
    sha: ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301
  - kind: registry
    name: anstream
    version: 0.6.21
    sha: 43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a
  - kind: registry
    name: anstyle
    version: 1.0.13
    sha: 5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78
  - kind: registry
    name: anstyle-parse
    version: 0.2.7
    sha: 4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2
  - kind: registry
    name: anstyle-query
    version: 1.1.5
    sha: 40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc
  - kind: registry
    name: anstyle-wincon
    version: 3.0.11
    sha: 291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d
  - kind: registry
    name: anyhow
    version: 1.0.101
    sha: 5f0e0fee31ef5ed1ba1316088939cea399010ed7731dba877ed44aeb407a75ea
  - kind: registry
    name: bitflags
    version: 2.10.0
    sha: 812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3
  - kind: registry
    name: bumpalo
    version: 3.19.1
    sha: 5dd9dc738b7a8311c7ade152424974d8115f2cdad61e8dab8dac9f2362298510
  - kind: registry
    name: cc
    version: 1.2.55
    sha: 47b26a0954ae34af09b50f0de26458fa95369a0d478d8236d3f93082b219bd29
  - kind: registry
    name: cfg-if
    version: 1.0.4
    sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
  - kind: registry
    name: clap
    version: 4.5.57
    sha: 6899ea499e3fb9305a65d5ebf6e3d2248c5fab291f300ad0a704fbe142eae31a
  - kind: registry
    name: clap_builder
    version: 4.5.57
    sha: 7b12c8b680195a62a8364d16b8447b01b6c2c8f9aaf68bee653be34d4245e238
  - kind: registry
    name: clap_derive
    version: 4.5.55
    sha: a92793da1a46a5f2a02a6f4c46c6496b28c43638adea8306fcb0caa1634f24e5
  - kind: registry
    name: clap_lex
    version: 0.7.7
    sha: c3e64b0cc0439b12df2fa678eae89a1c56a529fd067a9115f7827f1fffd22b32
  - kind: registry
    name: clap_mangen
    version: 0.2.31
    sha: 439ea63a92086df93893164221ad4f24142086d535b3a0957b9b9bea2dc86301
  - kind: registry
    name: colorchoice
    version: 1.0.4
    sha: b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75
  - kind: registry
    name: der
    version: 0.7.10
    sha: e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb
  - kind: registry
    name: env_filter
    version: 0.1.4
    sha: 1bf3c259d255ca70051b30e2e95b5446cdb8949ac4cd22c0d7fd634d89f568e2
  - kind: registry
    name: env_logger
    version: 0.11.8
    sha: 13c863f0904021b108aa8b2f55046443e6b1ebde8fd4a15c399893aae4fa069f
  - kind: registry
    name: errno
    version: 0.3.14
    sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
  - kind: registry
    name: fallible-iterator
    version: 0.3.0
    sha: 2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649
  - kind: registry
    name: fallible-streaming-iterator
    version: 0.1.9
    sha: 7360491ce676a36bf9bb3c56c1aa791658183a54d2744120f27285738d90465a
  - kind: registry
    name: fastrand
    version: 2.3.0
    sha: 37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be
  - kind: registry
    name: find-msvc-tools
    version: 0.1.9
    sha: 5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582
  - kind: registry
    name: foldhash
    version: 0.2.0
    sha: 77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb
  - kind: registry
    name: getrandom
    version: 0.3.4
    sha: 899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd
  - kind: registry
    name: hashbrown
    version: 0.16.1
    sha: 841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100
  - kind: registry
    name: hashlink
    version: 0.11.0
    sha: ea0b22561a9c04a7cb1a302c013e0259cd3b4bb619f145b32f72b8b4bcbed230
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.2
    sha: a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695
  - kind: registry
    name: jiff
    version: 0.2.19
    sha: d89a5b5e10d5a9ad6e5d1f4bd58225f655d6fe9767575a5e8ac5a6fe64e04495
  - kind: registry
    name: jiff-static
    version: 0.2.19
    sha: ff7a39c8862fc1369215ccf0a8f12dd4598c7f6484704359f0351bd617034dbf
  - kind: registry
    name: js-sys
    version: 0.3.85
    sha: 8c942ebf8e95485ca0d52d97da7c5a2c387d0e7f0ba4c35e93bfcaee045955b3
  - kind: registry
    name: libc
    version: 0.2.180
    sha: bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc
  - kind: registry
    name: libsqlite3-sys
    version: 0.36.0
    sha: 95b4103cffefa72eb8428cb6b47d6627161e51c2739fc5e3b734584157bc642a
  - kind: registry
    name: linux-raw-sys
    version: 0.11.0
    sha: df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039
  - kind: registry
    name: log
    version: 0.4.29
    sha: 5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897
  - kind: registry
    name: memchr
    version: 2.8.0
    sha: f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79
  - kind: registry
    name: once_cell
    version: 1.21.3
    sha: 42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d
  - kind: registry
    name: once_cell_polyfill
    version: 1.70.2
    sha: 384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe
  - kind: registry
    name: pkg-config
    version: 0.3.32
    sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
  - kind: registry
    name: portable-atomic
    version: 1.13.1
    sha: c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49
  - kind: registry
    name: portable-atomic-util
    version: 0.2.5
    sha: 7a9db96d7fa8782dd8c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5
  - kind: registry
    name: proc-macro2
    version: 1.0.106
    sha: 8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934
  - kind: registry
    name: quote
    version: 1.0.44
    sha: 21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4
  - kind: registry
    name: r-efi
    version: 5.3.0
    sha: 69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f
  - kind: registry
    name: regex
    version: 1.12.3
    sha: e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276
  - kind: registry
    name: regex-automata
    version: 0.4.14
    sha: 6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f
  - kind: registry
    name: regex-syntax
    version: 0.8.9
    sha: a96887878f22d7bad8a3b6dc5b7440e0ada9a245242924394987b21cf2210a4c
  - kind: registry
    name: roff
    version: 0.2.2
    sha: 88f8660c1ff60292143c98d08fc6e2f654d722db50410e3f3797d40baaf9d8f3
  - kind: registry
    name: rsqlite-vfs
    version: 0.1.0
    sha: a8a1f2315036ef6b1fbacd1972e8ee7688030b0a2121edfc2a6550febd41574d
  - kind: registry
    name: rusqlite
    version: 0.38.0
    sha: f1c93dd1c9683b438c392c492109cb702b8090b2bfc8fed6f6e4eb4523f17af3
  - kind: registry
    name: rustix
    version: 1.1.3
    sha: 146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34
  - kind: registry
    name: rustversion
    version: 1.0.22
    sha: b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d
  - kind: registry
    name: serde_core
    version: 1.0.228
    sha: 41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad
  - kind: registry
    name: serde_derive
    version: 1.0.228
    sha: d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: smallvec
    version: 1.15.1
    sha: 67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03
  - kind: registry
    name: sqlite-wasm-rs
    version: 0.5.2
    sha: 2f4206ed3a67690b9c29b77d728f6acc3ce78f16bf846d83c94f76400320181b
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: syn
    version: 2.0.114
    sha: d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a
  - kind: registry
    name: tempfile
    version: 3.24.0
    sha: 655da9c7eb6305c55742045d5a8d2037996d61d8de95806335c7c86ce0f82e9c
  - kind: registry
    name: thiserror
    version: 2.0.18
    sha: 4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4
  - kind: registry
    name: thiserror-impl
    version: 2.0.18
    sha: ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5
  - kind: registry
    name: unicode-ident
    version: 1.0.22
    sha: 9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - kind: registry
    name: wasip2
    version: 1.0.2+wasi-0.2.9
    sha: 9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5
  - kind: registry
    name: wasm-bindgen
    version: 0.2.108
    sha: 64024a30ec1e37399cf85a7ffefebdb72205ca1c972291c51512360d90bd8566
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.108
    sha: 008b239d9c740232e71bd39e8ef6429d27097518b6b30bdf9086833bd5b6d608
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.108
    sha: 5256bae2d58f54820e6490f9839c49780dff84c65aeab9e772f15d5f0e913a55
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.108
    sha: 1f01b580c9ac74c8d8f0c0e4afb04eeef2acf145458e52c03845ee9cd23e3d12
  - kind: registry
    name: windows-link
    version: 0.2.1
    sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
  - kind: registry
    name: windows-sys
    version: 0.61.2
    sha: ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc
  - kind: registry
    name: wit-bindgen
    version: 0.51.0
    sha: d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5
  - kind: registry
    name: zeroize
    version: 1.8.2
    sha: b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0
