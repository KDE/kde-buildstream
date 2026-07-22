# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/procs/-/raw/main/PKGBUILD?ref_type=heads
kind: cargo

description: A modern replacement for ps written in Rust

build-depends:
- freedesktop-sdk.bst:bootstrap/stripper.bst
- freedesktop-sdk.bst:components/rust.bst
- freedesktop-sdk.bst:components/gcc.bst
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:dalance/procs.git
  track: v*
- kind: cargo2
  cargo-lock: Cargo.lock
  ref:
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
  - kind: registry
    name: ahash
    version: 0.7.8
    sha: 891477e0c6a8957309ee5c45a6368af3ae14bb510732d2684ffa19af310920f9
  - kind: registry
    name: aho-corasick
    version: 1.1.4
    sha: ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301
  - kind: registry
    name: android_system_properties
    version: 0.1.5
    sha: 819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311
  - kind: registry
    name: anstream
    version: 1.0.0
    sha: 824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d
  - kind: registry
    name: anstyle
    version: 1.0.14
    sha: 940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000
  - kind: registry
    name: anstyle-parse
    version: 1.0.0
    sha: 52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e
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
    version: 1.0.102
    sha: 7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c
  - kind: registry
    name: arrayvec
    version: 0.7.7
    sha: f02882884d3e1bc524fb12c79f107f6ad0e1cfd498c536ffb494301740995dfe
  - kind: registry
    name: async-stream
    version: 0.3.6
    sha: 0b5a71a6f37880a80d1d7f19efd781e4b5de42c88f0722cc13bcb6cc2cfe8476
  - kind: registry
    name: async-stream-impl
    version: 0.3.6
    sha: c7c24de15d275a1ecfd47a380fb4d5ec9bfe0933f309ed5e705b775596a3574d
  - kind: registry
    name: async-trait
    version: 0.1.89
    sha: 9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb
  - kind: registry
    name: autocfg
    version: 1.5.1
    sha: f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: bindgen
    version: 0.65.1
    sha: cfdf7b466f9a4903edc73f95d6d2bcd5baf8ae620638762244d3f60143643cc5
  - kind: registry
    name: bindgen
    version: 0.72.1
    sha: 993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895
  - kind: registry
    name: bit-set
    version: 0.8.0
    sha: 08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3
  - kind: registry
    name: bit-vec
    version: 0.8.0
    sha: 5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.13.0
    sha: b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8
  - kind: registry
    name: bitvec
    version: 1.1.1
    sha: ddcec3d12c579d40898fe0a9a358a803c23e9c52ca3c425707f81c9436211837
  - kind: registry
    name: borsh
    version: 1.7.0
    sha: 2f3f6da4992df95bbcd9af42a6c7dcb994498fc9048230405f3b36ff7cd3f145
  - kind: registry
    name: borsh-derive
    version: 1.7.0
    sha: 3ae8fb4fb5740e4b2c4884ff95f5f32f5e8479db1e8fd8eb49ddbe09eb09bb7c
  - kind: registry
    name: bsd-kvm
    version: 0.1.5
    sha: 94b4eb28b17b77a2974f6307a6f7f18c294d71543ceac0f021b89a4eb9e3ccbe
  - kind: registry
    name: bsd-kvm-sys
    version: 0.2.0
    sha: 65408f926d3766661595309e0a70bbed02ef27bb74603db6199ab9394103c932
  - kind: registry
    name: bumpalo
    version: 3.20.3
    sha: 72f5acc6cb2ba439de613abc23857ec3d78374d8ed5ac84e9d11336e87da8649
  - kind: registry
    name: byte-unit
    version: 5.2.3
    sha: 37bcaa4a0975bed4a760af3efe4368825098ce5f9d37a30c5a021d635dc63d8f
  - kind: registry
    name: bytecheck
    version: 0.6.12
    sha: 23cdc57ce23ac53c931e88a43d06d070a6fd142f2617be5855eb75efc9beb1c2
  - kind: registry
    name: bytecheck_derive
    version: 0.6.12
    sha: 3db406d29fbcd95542e92559bed4d8ad92636d1ca8b3b72ede10b4bcc010e659
  - kind: registry
    name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - kind: registry
    name: bytes
    version: 1.12.0
    sha: 8ae3f5d315924270530207e2a68396c3cc547f6dca3fbdca317cfb1a51edb593
  - kind: registry
    name: cc
    version: 1.2.65
    sha: e228eec9be7c17ccb640b59b36a5cd805ea2a564a4c5e162c2f659fea30d3b96
  - kind: registry
    name: cexpr
    version: 0.6.0
    sha: 6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766
  - kind: registry
    name: cfg-if
    version: 1.0.4
    sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
  - kind: registry
    name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
  - kind: registry
    name: chrono
    version: 0.4.45
    sha: 1aa79e62e7697b8e29b513a68abacf485adcd1fe8284a4316c5ae868e6633327
  - kind: registry
    name: clang-sys
    version: 1.8.1
    sha: 0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4
  - kind: registry
    name: clap
    version: 4.6.1
    sha: 1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51
  - kind: registry
    name: clap_builder
    version: 4.6.0
    sha: 714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f
  - kind: registry
    name: clap_complete
    version: 4.6.5
    sha: e0a7a9bfdb35811f9e59832f0f05975114d2251b415fb534108e6f34060fd772
  - kind: registry
    name: clap_derive
    version: 4.6.1
    sha: f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9
  - kind: registry
    name: clap_lex
    version: 1.1.0
    sha: c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9
  - kind: registry
    name: clap_mangen
    version: 0.3.0
    sha: d82842b45bf9f6a3be090dd860095ac30728042c08e0d6261ca7259b5d850f07
  - kind: registry
    name: colorchoice
    version: 1.0.5
    sha: 1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570
  - kind: registry
    name: console
    version: 0.16.3
    sha: d64e8af5551369d19cf50138de61f1c42074ab970f74e99be916646777f8fc87
  - kind: registry
    name: convert_case
    version: 0.10.0
    sha: 633458d4ef8c78b72454de2d54fd6ab2e60f9e02be22f3c6104cdc8a4e0fceb9
  - kind: registry
    name: core-foundation-sys
    version: 0.8.7
    sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
  - kind: registry
    name: crc32fast
    version: 1.5.0
    sha: 9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511
  - kind: registry
    name: crossbeam-channel
    version: 0.5.15
    sha: 82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2
  - kind: registry
    name: crossbeam-utils
    version: 0.8.21
    sha: d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28
  - kind: registry
    name: crossterm
    version: 0.28.1
    sha: 829d955a0bb380ef178a640b91779e3987da38c9aea133b20614cfed8cdea9c6
  - kind: registry
    name: crossterm
    version: 0.29.0
    sha: d8b9f2e4c67f833b660cdb0a3523065869fb35570177239812ed4c905aeff87b
  - kind: registry
    name: crossterm_winapi
    version: 0.9.1
    sha: acdd7c62a3665c7f6830a51635d9ac9b23ed385797f70a83bb8bafe9c572ab2b
  - kind: registry
    name: deranged
    version: 0.5.8
    sha: 7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c
  - kind: registry
    name: derive_more
    version: 2.1.1
    sha: d751e9e49156b02b44f9c1815bcb94b984cdcc4396ecc32521c739452808b134
  - kind: registry
    name: derive_more-impl
    version: 2.1.1
    sha: 799a97264921d8623a957f6c3b9011f3b5492f557bbb7a5a19b7fa6d06ba8dcb
  - kind: registry
    name: directories
    version: 6.0.0
    sha: 16f5094c54661b38d03bd7e50df373292118db60b585c08a411c6d840017fe7d
  - kind: registry
    name: dirs
    version: 6.0.0
    sha: c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e
  - kind: registry
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
  - kind: registry
    name: displaydoc
    version: 0.2.6
    sha: 1ac70aa55017e108007fbaf5aa0f54b021c98f92ff8af59d42eda9da96e3dd4f
  - kind: registry
    name: dockworker
    version: 0.17.0
    sha: a007b60a4ad8c00267b75f3e08576f141b711dcd32267d3f1cb3991dac0d3a58
  - kind: registry
    name: document-features
    version: 0.2.12
    sha: d4b8a88685455ed29a21542a33abd9cb6510b6b129abadabdcef0f4c55bc8f61
  - kind: registry
    name: downcast
    version: 0.11.0
    sha: 1435fa1053d8b2fbbe9be7e97eca7f33d37b28409959813daefc1446a14247f1
  - kind: registry
    name: dyn-clone
    version: 1.0.20
    sha: d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555
  - kind: registry
    name: either
    version: 1.16.0
    sha: 91622ff5e7162018101f2fea40d6ebf4a78bbe5a49736a2020649edf9693679e
  - kind: registry
    name: encode_unicode
    version: 1.0.0
    sha: 34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0
  - kind: registry
    name: equivalent
    version: 1.0.2
    sha: 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
  - kind: registry
    name: errno
    version: 0.2.8
    sha: f639046355ee4f37944e44f60642c6f3a7efa3cf6b78c78a0d989a8ce6c396a1
  - kind: registry
    name: errno
    version: 0.3.14
    sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
  - kind: registry
    name: errno-dragonfly
    version: 0.1.2
    sha: aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf
  - kind: registry
    name: fancy-regex
    version: 0.18.0
    sha: e1e1dacd0d2082dfcf1351c4bdd566bbe89a2b263235a2b50058f1e130a47277
  - kind: registry
    name: filetime
    version: 0.2.29
    sha: 5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759
  - kind: registry
    name: find-msvc-tools
    version: 0.1.9
    sha: 5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582
  - kind: registry
    name: flate2
    version: 1.1.9
    sha: 843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c
  - kind: registry
    name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - kind: registry
    name: form_urlencoded
    version: 1.2.2
    sha: cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf
  - kind: registry
    name: fragile
    version: 2.1.0
    sha: 8878864ba14bb86e818a412bfd6f18f9eabd4ec0f008a28e8f7eb61db532fcf9
  - kind: registry
    name: funty
    version: 2.0.0
    sha: e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c
  - kind: registry
    name: futures
    version: 0.3.32
    sha: 8b147ee9d1f6d097cef9ce628cd2ee62288d963e16fb287bd9286455b241382d
  - kind: registry
    name: futures-channel
    version: 0.3.32
    sha: 07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d
  - kind: registry
    name: futures-core
    version: 0.3.32
    sha: 7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d
  - kind: registry
    name: futures-io
    version: 0.3.32
    sha: cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718
  - kind: registry
    name: futures-macro
    version: 0.3.32
    sha: e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b
  - kind: registry
    name: futures-sink
    version: 0.3.32
    sha: c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893
  - kind: registry
    name: futures-task
    version: 0.3.32
    sha: 037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393
  - kind: registry
    name: futures-util
    version: 0.3.32
    sha: 389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6
  - kind: registry
    name: getch
    version: 0.3.1
    sha: 13990e2d5b29e1770ddf7fc000afead4acb9bd8f8a9602de63bf189e261b1ba8
  - kind: registry
    name: getrandom
    version: 0.2.17
    sha: ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0
  - kind: registry
    name: glob
    version: 0.3.3
    sha: 0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280
  - kind: registry
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.17.1
    sha: ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - kind: registry
    name: home
    version: 0.5.12
    sha: cc627f471c528ff0c4a49e1d5e60450c8f6461dd6d10ba9dcd3a61d3dff7728d
  - kind: registry
    name: http
    version: 0.2.12
    sha: 601cbb57e577e2f5ef5be8e7b83f0f63994f25aa94d673e54a92d5c516d101f1
  - kind: registry
    name: http-body
    version: 0.4.6
    sha: 7ceab25649e9960c0311ea418d17bee82c0dcec1bd053b5f9a66e265a693bed2
  - kind: registry
    name: httparse
    version: 1.10.1
    sha: 6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87
  - kind: registry
    name: httpdate
    version: 1.0.3
    sha: df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9
  - kind: registry
    name: hyper
    version: 0.14.32
    sha: 41dfc780fdec9373c01bae43289ea34c972e40ee3c9f6b3c8801a35f35586ce7
  - kind: registry
    name: hyperlocal
    version: 0.8.0
    sha: 0fafdf7b2b2de7c9784f76e02c0935e65a8117ec3b768644379983ab333ac98c
  - kind: registry
    name: iana-time-zone
    version: 0.1.65
    sha: e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470
  - kind: registry
    name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - kind: registry
    name: icu_collections
    version: 2.2.0
    sha: 2984d1cd16c883d7935b9e07e44071dca8d917fd52ecc02c04d5fa0b5a3f191c
  - kind: registry
    name: icu_locale_core
    version: 2.2.0
    sha: 92219b62b3e2b4d88ac5119f8904c10f8f61bf7e95b640d25ba3075e6cac2c29
  - kind: registry
    name: icu_normalizer
    version: 2.2.0
    sha: c56e5ee99d6e3d33bd91c5d85458b6005a22140021cc324cea84dd0e72cff3b4
  - kind: registry
    name: icu_normalizer_data
    version: 2.2.0
    sha: da3be0ae77ea334f4da67c12f149704f19f81d1adf7c51cf482943e84a2bad38
  - kind: registry
    name: icu_properties
    version: 2.2.0
    sha: bee3b67d0ea5c2cca5003417989af8996f8604e34fb9ddf96208a033901e70de
  - kind: registry
    name: icu_properties_data
    version: 2.2.0
    sha: 8e2bbb201e0c04f7b4b3e14382af113e17ba4f63e2c9d2ee626b720cbce54a14
  - kind: registry
    name: icu_provider
    version: 2.2.0
    sha: 139c4cf31c8b5f33d7e199446eff9c1e02decfc2f0eec2c8d71f65befa45b421
  - kind: registry
    name: idna
    version: 1.1.0
    sha: 3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de
  - kind: registry
    name: idna_adapter
    version: 1.2.2
    sha: cb68373c0d6620ef8105e855e7745e18b0d00d3bdb07fb532e434244cdb9a714
  - kind: registry
    name: indexmap
    version: 2.14.0
    sha: d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.2
    sha: a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695
  - kind: registry
    name: itertools
    version: 0.13.0
    sha: 413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186
  - kind: registry
    name: itoa
    version: 1.0.18
    sha: 8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682
  - kind: registry
    name: js-sys
    version: 0.3.103
    sha: 53b44bfcdb3f8d5837a46dae1ca9660a837176eee74a28b229bc626816589102
  - kind: registry
    name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: lazycell
    version: 1.3.0
    sha: 830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55
  - kind: registry
    name: libc
    version: 0.2.186
    sha: 68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66
  - kind: registry
    name: libloading
    version: 0.8.9
    sha: d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55
  - kind: registry
    name: libproc
    version: 0.14.11
    sha: a54ad7278b8bc5301d5ffd2a94251c004feb971feba96c971ea4063645990757
  - kind: registry
    name: libredox
    version: 0.1.17
    sha: f02ab6bace2054fb888a3c16f990117b579d14a3088e472d63c6011fa185c9d3
  - kind: registry
    name: linux-raw-sys
    version: 0.12.1
    sha: 32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53
  - kind: registry
    name: linux-raw-sys
    version: 0.4.15
    sha: d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab
  - kind: registry
    name: litemap
    version: 0.8.2
    sha: 92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0
  - kind: registry
    name: litrs
    version: 1.0.0
    sha: 11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092
  - kind: registry
    name: lock_api
    version: 0.4.14
    sha: 224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965
  - kind: registry
    name: log
    version: 0.4.33
    sha: 0ceec5bc11778974d1bcb055b18002eba7f4b3518b6a0081b3af5f21666da9ad
  - kind: registry
    name: mach2
    version: 0.6.0
    sha: dae608c151f68243f2b000364e1f7b186d9c29845f7d2d85bd31b9ad77ad552b
  - kind: registry
    name: memchr
    version: 2.8.2
    sha: 88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4
  - kind: registry
    name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - kind: registry
    name: miniz_oxide
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
  - kind: registry
    name: minus
    version: 5.7.1
    sha: 2657ec5f6a6edc55a85c8db0c572436b612eb036af00e7eee47e0a622095ed96
  - kind: registry
    name: mio
    version: 1.2.1
    sha: 02bd0af71c67b473010cbbc60715ee815645a4dc942899111f494b4b737d6fda
  - kind: registry
    name: mockall
    version: 0.13.1
    sha: 39a6bfcc6c8c7eed5ee98b9c3e33adc726054389233e201c95dab2d41a3839d2
  - kind: registry
    name: mockall_derive
    version: 0.13.1
    sha: 25ca3004c2efe9011bd4e461bd8256445052b9615405b4f7ea43fc8ca5c20898
  - kind: registry
    name: named_pipe
    version: 0.4.1
    sha: ad9c443cce91fc3e12f017290db75dde490d685cdaaf508d7159d7cf41f0eb2b
  - kind: registry
    name: nix
    version: 0.31.3
    sha: cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - kind: registry
    name: num-conv
    version: 0.2.2
    sha: 521739c6d2bac4aa25192232afe6841231376b2b26d4d9fae5ecf8ca5772e441
  - kind: registry
    name: num-traits
    version: 0.2.19
    sha: 071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841
  - kind: registry
    name: num_threads
    version: 0.1.7
    sha: 5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9
  - kind: registry
    name: once_cell
    version: 1.21.4
    sha: 9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50
  - kind: registry
    name: once_cell_polyfill
    version: 1.70.2
    sha: 384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe
  - kind: registry
    name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - kind: registry
    name: pager
    version: 0.16.1
    sha: 2599211a5c97fbbb1061d3dc751fa15f404927e4846e07c643287d6d1f462880
  - kind: registry
    name: parking_lot
    version: 0.12.5
    sha: 93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a
  - kind: registry
    name: parking_lot_core
    version: 0.9.12
    sha: 2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1
  - kind: registry
    name: peeking_take_while
    version: 0.1.2
    sha: 19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099
  - kind: registry
    name: percent-encoding
    version: 2.3.2
    sha: 9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220
  - kind: registry
    name: pin-project
    version: 1.1.13
    sha: 2466b2336ed02bcdca6b294417127b90ec92038d1d5c4fbeac971a922e0e0924
  - kind: registry
    name: pin-project-internal
    version: 1.1.13
    sha: c96395f0a926bc13b1c17622aaddda1ecb55d49c8f1bf9777e4d877800a43f8b
  - kind: registry
    name: pin-project-lite
    version: 0.2.17
    sha: a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd
  - kind: registry
    name: potential_utf
    version: 0.1.5
    sha: 0103b1cef7ec0cf76490e969665504990193874ea05c85ff9bab8b911d0a0564
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppv-lite86
    version: 0.2.21
    sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
  - kind: registry
    name: predicates
    version: 3.1.4
    sha: ada8f2932f28a27ee7b70dd6c1c39ea0675c55a36879ab92f3a715eaa1e63cfe
  - kind: registry
    name: predicates-core
    version: 1.0.10
    sha: cad38746f3166b4031b1a0d39ad9f954dd291e7854fcc0eed52ee41a0b50d144
  - kind: registry
    name: predicates-tree
    version: 1.0.13
    sha: d0de1b847b39c8131db0467e9df1ff60e6d0562ab8e9a16e568ad0fdb372e2f2
  - kind: registry
    name: prettyplease
    version: 0.2.37
    sha: 479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b
  - kind: registry
    name: proc-macro-crate
    version: 3.5.0
    sha: e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f
  - kind: registry
    name: proc-macro2
    version: 1.0.106
    sha: 8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934
  - kind: registry
    name: procfs
    version: 0.18.0
    sha: 25485360a54d6861439d60facef26de713b1e126bf015ec8f98239467a2b82f7
  - kind: registry
    name: procfs-core
    version: 0.18.0
    sha: e6401bf7b6af22f78b563665d15a22e9aef27775b79b149a66ca022468a4e405
  - kind: registry
    name: ptr_meta
    version: 0.1.4
    sha: 0738ccf7ea06b608c10564b31debd4f5bc5e197fc8bfe088f68ae5ce81e7a4f1
  - kind: registry
    name: ptr_meta_derive
    version: 0.1.4
    sha: 16b845dbfca988fa33db069c0e230574d15a3088f147a87b64c7589eb662c9ac
  - kind: registry
    name: quote
    version: 1.0.46
    sha: dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368
  - kind: registry
    name: radium
    version: 0.7.0
    sha: dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09
  - kind: registry
    name: rand
    version: 0.8.6
    sha: 5ca0ecfa931c29007047d1bc58e623ab12e5590e8c7cc53200d5202b69266d8a
  - kind: registry
    name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - kind: registry
    name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
  - kind: registry
    name: redox_users
    version: 0.5.2
    sha: a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac
  - kind: registry
    name: ref-cast
    version: 1.0.25
    sha: f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d
  - kind: registry
    name: ref-cast-impl
    version: 1.0.25
    sha: b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da
  - kind: registry
    name: regex
    version: 1.12.4
    sha: f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a5a8c31cd6db45d4a6ba
  - kind: registry
    name: regex-automata
    version: 0.4.14
    sha: 6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f
  - kind: registry
    name: regex-syntax
    version: 0.8.11
    sha: d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4
  - kind: registry
    name: rend
    version: 0.4.2
    sha: 71fe3824f5629716b1589be05dacd749f6aa084c87e00e016714a8cdfccc997c
  - kind: registry
    name: rkyv
    version: 0.7.46
    sha: 2297bf9c81a3f0dc96bc9521370b88f054168c29826a75e89c55ff196e7ed6a1
  - kind: registry
    name: rkyv_derive
    version: 0.7.46
    sha: 84d7b42d4b8d06048d3ac8db0eb31bcb942cbeb709f0b5f2b2ebde398d3038f5
  - kind: registry
    name: roff
    version: 1.1.1
    sha: 323c417e1d9665a65b263ec744ba09030cfb277e9daa0b018a4ab62e57bc8189
  - kind: registry
    name: rust_decimal
    version: 1.42.1
    sha: be2a24f50780bc85f09cc6ac299bdf1424302742d77221106859c9d8b102126a
  - kind: registry
    name: rustc-hash
    version: 1.1.0
    sha: 08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2
  - kind: registry
    name: rustc-hash
    version: 2.1.2
    sha: 94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe
  - kind: registry
    name: rustc_version
    version: 0.4.1
    sha: cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92
  - kind: registry
    name: rustix
    version: 0.38.44
    sha: fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154
  - kind: registry
    name: rustix
    version: 1.1.4
    sha: b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190
  - kind: registry
    name: rustversion
    version: 1.0.22
    sha: b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d
  - kind: registry
    name: schemars
    version: 1.2.1
    sha: a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: seahash
    version: 4.1.0
    sha: 1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b
  - kind: registry
    name: semver
    version: 1.0.28
    sha: 8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd
  - kind: registry
    name: serde
    version: 1.0.228
    sha: 9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e
  - kind: registry
    name: serde_core
    version: 1.0.228
    sha: 41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad
  - kind: registry
    name: serde_derive
    version: 1.0.228
    sha: d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79
  - kind: registry
    name: serde_json
    version: 1.0.150
    sha: e8014e44b4736ed0538adeecded0fce2a272f22dc9578a7eb6b2d9993c74cfb9
  - kind: registry
    name: serde_spanned
    version: 1.1.1
    sha: 6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: shlex
    version: 2.0.1
    sha: f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba
  - kind: registry
    name: signal-hook
    version: 0.3.18
    sha: d881a16cf4426aa584979d30bd82cb33429027e42122b169753d6ef1085ed6e2
  - kind: registry
    name: signal-hook-mio
    version: 0.2.5
    sha: b75a19a7a740b25bc7944bdee6172368f988763b744e3d4dfe753f6b4ece40cc
  - kind: registry
    name: signal-hook-registry
    version: 1.4.8
    sha: c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b
  - kind: registry
    name: simd-adler32
    version: 0.3.9
    sha: 703d5c7ef118737c72f1af64ad2f6f8c5e1921f818cdcb97b8fe6fc69bf66214
  - kind: registry
    name: simdutf8
    version: 0.1.5
    sha: e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e
  - kind: registry
    name: simplelog
    version: 0.12.2
    sha: 16257adbfaef1ee58b1363bdc0664c9b8e1e30aed86049635fb5f147d065a9c0
  - kind: registry
    name: slab
    version: 0.4.12
    sha: 0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5
  - kind: registry
    name: smallvec
    version: 1.15.2
    sha: 8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90
  - kind: registry
    name: socket2
    version: 0.5.10
    sha: e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678
  - kind: registry
    name: socket2
    version: 0.6.4
    sha: 52d1cfed4120b4d927bf7c0f86d2087a4a7d6027c906d9f9d525a80573b9be51
  - kind: registry
    name: stable_deref_trait
    version: 1.2.1
    sha: 6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - kind: registry
    name: syn
    version: 2.0.118
    sha: 1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422
  - kind: registry
    name: synstructure
    version: 0.13.2
    sha: 728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2
  - kind: registry
    name: tap
    version: 1.0.1
    sha: 55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369
  - kind: registry
    name: tar
    version: 0.4.46
    sha: 3f6221d9a6003c78398e3b239969f352578258df48c8eb051caadae0015bc840
  - kind: registry
    name: termbg
    version: 0.6.2
    sha: 8bf44577a1adf3dfd7fec3b8763074467e27b2ad35ff9157bc3f0a51bb0a3dd4
  - kind: registry
    name: termcolor
    version: 1.4.1
    sha: 06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755
  - kind: registry
    name: termios
    version: 0.3.3
    sha: 411c5bf740737c7918b8b1fe232dca4dc9f8e754b8ad5e20966814001ed0ac6b
  - kind: registry
    name: termtree
    version: 0.5.1
    sha: 8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683
  - kind: registry
    name: textwrap
    version: 0.16.2
    sha: c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057
  - kind: registry
    name: thiserror
    version: 1.0.69
    sha: b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52
  - kind: registry
    name: thiserror
    version: 2.0.18
    sha: 4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.18
    sha: ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5
  - kind: registry
    name: time
    version: 0.3.51
    sha: 85c17d80feb7334b40c484e45ed1a5273dfd8bfda537c3be2e74a06a6686f327
  - kind: registry
    name: time-core
    version: 0.1.9
    sha: 9e1c906769ad99c88eaa54e728060edef082f8e358ff32030cb7c7d315e81109
  - kind: registry
    name: time-macros
    version: 0.2.30
    sha: dcef1a61bdb119096e153208ec5cbec23944ce8bca13be5c7f60c634f7403935
  - kind: registry
    name: tinystr
    version: 0.8.3
    sha: c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d
  - kind: registry
    name: tinyvec
    version: 1.11.0
    sha: 3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: tokio
    version: 1.52.3
    sha: 8fc7f01b389ac15039e4dc9531aa973a135d7a4135281b12d7c1bc79fd57fffe
  - kind: registry
    name: tokio-macros
    version: 2.7.0
    sha: 385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496
  - kind: registry
    name: tokio-stream
    version: 0.1.18
    sha: 32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70
  - kind: registry
    name: tokio-util
    version: 0.7.18
    sha: 9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098
  - kind: registry
    name: toml
    version: 1.1.2+spec-1.1.0
    sha: 81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee
  - kind: registry
    name: toml_datetime
    version: 1.1.1+spec-1.1.0
    sha: 3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7
  - kind: registry
    name: toml_edit
    version: 0.25.12+spec-1.1.0
    sha: d2153edc6955a6c354fad8f5efd38b6a8769bdccf9fe50f8e1329f81b0baa5d7
  - kind: registry
    name: toml_parser
    version: 1.1.2+spec-1.1.0
    sha: a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526
  - kind: registry
    name: toml_writer
    version: 1.1.1+spec-1.1.0
    sha: 756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db
  - kind: registry
    name: tower-service
    version: 0.3.3
    sha: 8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3
  - kind: registry
    name: tracing
    version: 0.1.44
    sha: 63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100
  - kind: registry
    name: tracing-core
    version: 0.1.36
    sha: db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a
  - kind: registry
    name: try-lock
    version: 0.2.5
    sha: e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b
  - kind: registry
    name: unicode-ident
    version: 1.0.24
    sha: e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75
  - kind: registry
    name: unicode-segmentation
    version: 1.13.3
    sha: c6f5d3c3b1bf09027a88a6bc961fc00497d651009560b5463668dc81b0fa87a8
  - kind: registry
    name: unicode-width
    version: 0.2.2
    sha: b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254
  - kind: registry
    name: url
    version: 2.5.8
    sha: ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed
  - kind: registry
    name: utf8-width
    version: 0.1.8
    sha: 1292c0d970b54115d14f2492fe0170adf21d68a1de108eebc51c1df4f346a091
  - kind: registry
    name: utf8_iter
    version: 1.0.4
    sha: b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: uuid
    version: 1.23.4
    sha: bf80a72845275afea99e7f2b434723d3bc7e38470fcd1c7ed39a599c73319a53
  - kind: registry
    name: uzers
    version: 0.12.2
    sha: 0b8275fb1afee25b4111d2dc8b5c505dbbc4afd0b990cb96deb2d88bff8be18d
  - kind: registry
    name: version_check
    version: 0.9.5
    sha: 0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a
  - kind: registry
    name: want
    version: 0.3.1
    sha: bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e
  - kind: registry
    name: wasi
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
  - kind: registry
    name: wasm-bindgen
    version: 0.2.126
    sha: 4b067c0c11094aef6b7a801c1e34a26affafdf3d051dba08456b868789aaf9a4
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.126
    sha: 167ce5e579f6bcf889c4f7175a8a5a585de84e8ff93976ce393efa5f2837aab1
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.126
    sha: f3997c7839262f4ef12cf90b818d6340c18e80f263f1a94bf157d0ec4420380e
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.126
    sha: dc1b4cb0cc549fcf58d7dfc081778139b3d283a081644e833e84682ad71cea24
  - kind: registry
    name: which
    version: 4.4.2
    sha: 87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7
  - kind: registry
    name: which
    version: 8.0.4
    sha: 48d7cd18d4acb58fb3cdfe9ea54e6cd96a4e7d4cc45c56338b236e82dad47248
  - kind: registry
    name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - kind: registry
    name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - kind: registry
    name: winapi-util
    version: 0.1.11
    sha: c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22
  - kind: registry
    name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - kind: registry
    name: windows-core
    version: 0.62.2
    sha: b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb
  - kind: registry
    name: windows-implement
    version: 0.60.2
    sha: 053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf
  - kind: registry
    name: windows-interface
    version: 0.59.3
    sha: 3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358
  - kind: registry
    name: windows-link
    version: 0.2.1
    sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
  - kind: registry
    name: windows-result
    version: 0.4.1
    sha: 7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5
  - kind: registry
    name: windows-strings
    version: 0.5.1
    sha: 7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091
  - kind: registry
    name: windows-sys
    version: 0.52.0
    sha: 282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d
  - kind: registry
    name: windows-sys
    version: 0.59.0
    sha: 1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b
  - kind: registry
    name: windows-sys
    version: 0.61.2
    sha: ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc
  - kind: registry
    name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_i686_gnu
    version: 0.52.6
    sha: 8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - kind: registry
    name: winnow
    version: 1.0.3
    sha: 0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1
  - kind: registry
    name: writeable
    version: 0.6.3
    sha: 1ffae5123b2d3fc086436f8834ae3ab053a283cfac8fe0a0b8eaae044768a4c4
  - kind: registry
    name: wyz
    version: 0.5.1
    sha: 05f360fc0b24296329c78fda852a1e9ae82de9cf7b27dae4b7f62f118f77b9ed
  - kind: registry
    name: xattr
    version: 1.6.1
    sha: 32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156
  - kind: registry
    name: yoke
    version: 0.8.3
    sha: 709fe23a0424b6a435d82152b1bd3fdfb0833487d5fa90d05d42762a9891fef5
  - kind: registry
    name: yoke-derive
    version: 0.8.2
    sha: de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e
  - kind: registry
    name: zerocopy
    version: 0.8.52
    sha: ce1022995ff5ff5d841ad7d994facc23098cd40152f2c1d11cd607c6f530653f
  - kind: registry
    name: zerocopy-derive
    version: 0.8.52
    sha: 1ae7f38b72ec2a254e2b87ef277cf2cd4fb97cbebf944faa6f33354da0867930
  - kind: registry
    name: zerofrom
    version: 0.1.8
    sha: 0ec05a11813ea801ff6d75110ad09cd0824ddba17dfe17128ea0d5f68e6c5272
  - kind: registry
    name: zerofrom-derive
    version: 0.1.7
    sha: 11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1
  - kind: registry
    name: zerotrie
    version: 0.2.4
    sha: 0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf
  - kind: registry
    name: zerovec
    version: 0.11.6
    sha: 90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239
  - kind: registry
    name: zerovec-derive
    version: 0.11.3
    sha: 625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555
  - kind: registry
    name: zmij
    version: 1.0.21
    sha: b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa
