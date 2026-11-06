# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/docker-buildx/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: Docker CLI plugin for extended build capabilities with BuildKit

build-depends:
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands:
  - go build -buildmode=pie -trimpath -mod=vendor -o buildx ./cmd/buildx
  install-commands:
  - install -Dm755 buildx "%{install-root}%{libdir}/docker/cli-plugins/docker-buildx"

sources:
- kind: git_repo
  url: github:docker/buildx.git
  track: 'v*'
  exclude:
  - "*rc*"
  ref: v0.38.2-0-g3c4cbd35852fc1a476923627a780a7836c28b654
- kind: go_mod_vendor
  ref:
  - module: cloud.google.com/go
    version: v0.123.0
    sha256sum: e9c9509cf75beb9516795eeb113d01a20e2a71496a66ed736b6ed2a516878d52
  - module: cloud.google.com/go/auth
    version: v0.20.0
    sha256sum: 06371584193bbb88a8f2c2931d85efaf45666cc52643be5b8aada6b053672f3a
  - module: cloud.google.com/go/auth/oauth2adapt
    version: v0.2.8
    sha256sum: 4cd64264bafc4dd05f645452d6e1485adf92309130bd82b4c595db10cd534963
  - module: cloud.google.com/go/compute/metadata
    version: v0.9.0
    sha256sum: f97e35d1c96239b8574054a77e312c95d2c82a89c21daf46ffeaea6d5fc59eca
  - module: cloud.google.com/go/iam
    version: v1.11.0
    sha256sum: 2cd818e6186002117032621c4b58bd7208525346c884d39ec141f281dbf4604b
  - module: cloud.google.com/go/kms
    version: v1.31.0
    sha256sum: 7be4d4abff08fa5c4dc6a238b28cc1de37c4c9798ab5070da37e0474cb70c189
  - module: cloud.google.com/go/longrunning
    version: v1.0.0
    sha256sum: 24124c60700de15a5f931d71054772db1cc757dcda9137ba085ccf1e32eae8c1
  - module: filippo.io/edwards25519
    version: v1.2.0
    sha256sum: 98f2d3ca9b88daa031b0fb2fb521b7ea386af1fed61b6f445a20bef7fa381c17
  - module: filippo.io/mldsa
    version: v0.0.0-20260215214346-43d0283efc3e
    sha256sum: c9e5675b68b2276cf10331d651a1b182a5ad7753906b1ac7dc314684b29e9902
  - module: github.com/AdaLogics/go-fuzz-headers
    version: v0.0.0-20240806141605-e8a1dd7889d6
    sha256sum: 2fc1bca9461db8f106c8b73652d51ab2b7f8a2620b2d453ffcb813bbadf587b6
  - module: github.com/AdamKorcz/go-fuzz-headers-1
    version: v0.0.0-20230919221257-8b5d3ce2d11d
    sha256sum: c5e2177eb7378b44d0a94e48ef95f3157050ecfdfaf839eb4fc496c25e8386cc
  - module: github.com/Azure/azure-sdk-for-go/sdk/azcore
    version: v1.21.1
    sha256sum: bce75c3fd1221d3d265127e1657046d343aed468e0060fd3ee61d33d63c54b3d
  - module: github.com/Azure/azure-sdk-for-go/sdk/azidentity
    version: v1.13.1
    sha256sum: 98012cfee26379a030c430ee2218c396201a9f9a35f17867c6f5c8a7cb6839a5
  - module: github.com/Azure/azure-sdk-for-go/sdk/internal
    version: v1.12.0
    sha256sum: 27800de3838500d4f3a0aaacea147fb49e0da3a7a6079a595c3e9d42df116ecf
  - module: github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys
    version: v1.5.0
    sha256sum: 957dd5a34b39bacf0503b17a3ecfd77d77ce3f90cce3da443e14daeb863ee7bf
  - module: github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal
    version: v1.2.0
    sha256sum: fea8b9a6517633da1b023698f9be20868fa21ef5886847bc9a939fbac89c7dee
  - module: github.com/Azure/go-ansiterm
    version: v0.0.0-20250102033503-faa5f7b0171c
    sha256sum: 53babc36db77d2d8af41cf86bddcf6203747335054c26b44165a6725c5455c34
  - module: github.com/AzureAD/microsoft-authentication-library-for-go
    version: v1.7.0
    sha256sum: bb6dabca00ee01efafe642c55110d35bd28e9619cebeef604e4d6e6237ea73ca
  - module: github.com/Masterminds/semver/v3
    version: v3.4.0
    sha256sum: 20cf1a0cf1820860c47cb87a0daa1422824e39ca15f47bb59a52b33bce31a239
  - module: github.com/Microsoft/go-winio
    version: v0.6.3-0.20251027160822-ad3df93bed29
    sha256sum: 6507326885292057ef1bf96a9d6a9300b1695f88a49b34f77fcfdf2a219c276c
  - module: github.com/Microsoft/hcsshim
    version: v0.15.0-rc.4
    sha256sum: 1a6d05fdeefddeb80e3e1823236bdd6b407ac5486532a1367d170c51973c355a
  - module: github.com/ProtonMail/go-crypto
    version: v1.4.1
    sha256sum: 70bbdc0f9e926738193aed968f7901efab41493752277c4c94c9b751aa55c42a
  - module: github.com/agext/levenshtein
    version: v1.2.3
    sha256sum: f24dcae174b3418f6340fb8f54797788a71130b960da4f07d3e08206cbcbdc02
  - module: github.com/agnivade/levenshtein
    version: v1.2.1
    sha256sum: 26bdb12f38a5ca1c45a666e8dea1c409189a383443fa14f4ff04f75af7022534
  - module: github.com/alessio/shellescape
    version: v1.4.1
    sha256sum: e28d444e73b803a15cf83e6179149d34c6c132baa60cb8137e5f0aea50a543bf
  - module: github.com/anchore/go-struct-converter
    version: v0.1.0
    sha256sum: d59da72ec5a33286bf91e47055e3a526474f9ee2755735be7221dad0540dc88c
  - module: github.com/apparentlymart/go-cidr
    version: v1.0.1
    sha256sum: 5af128e1ecdf5f2203fda104a653f13fb2e46acc3f68b2d7634a760a8f556ea0
  - module: github.com/apparentlymart/go-textseg/v15
    version: v15.0.0
    sha256sum: 4886c2e43b8cd2f6ffbd3a78ef436bd7bc8da7825ab7426257969f346e7bb7eb
  - module: github.com/arbovm/levenshtein
    version: v0.0.0-20160628152529-48b4e1c0c4d0
    sha256sum: 6541e823caaa51234899a38aa0a80180968741fc7d8f31b2561a29d9232e3612
  - module: github.com/armon/go-socks5
    version: v0.0.0-20160902184237-e75332964ef5
    sha256sum: f473e6dce826a0552639833cf72cfaa8bc7141daa7b537622d7f78eacfd9dfb3
  - module: github.com/asaskevich/govalidator
    version: v0.0.0-20230301143203-a9d515a09cc2
    sha256sum: 0f8ec67bbc585d29ec115c0885cef6f2431a422cc1cc10008e466ebe8be5dc37
  - module: github.com/aws/aws-sdk-go-v2
    version: v1.47.0
    sha256sum: 86316f5160d058070acc82beb4225ee9c3bd0244826cd650506eeb805be8864c
  - module: github.com/aws/aws-sdk-go-v2/aws/protocol/eventstream
    version: v1.7.20
    sha256sum: bd715c4dd8a605f44bdde484e0b59eb43815040d948527d61da01792977ff9ec
  - module: github.com/aws/aws-sdk-go-v2/config
    version: v1.33.4
    sha256sum: 41306bc516b134dcac08e28e6624922af733907ce83cd0250e6260576ea167de
  - module: github.com/aws/aws-sdk-go-v2/credentials
    version: v1.20.4
    sha256sum: 57e4b1f6efe01f818e665d35800328e2d98b8cc5c2efebaa69c10984c9cf2d31
  - module: github.com/aws/aws-sdk-go-v2/feature/ec2/imds
    version: v1.20.0
    sha256sum: a7e436ec8ab20d8debc95681b7c7915c39c098c3b7e38a84a32a10a903859584
  - module: github.com/aws/aws-sdk-go-v2/internal/configsources
    version: v1.5.3
    sha256sum: 03061e5b669d0809ef0b96bf9bc14a8ed822a648932f9634783d3b93e1c709a1
  - module: github.com/aws/aws-sdk-go-v2/internal/endpoints/v2
    version: v2.8.3
    sha256sum: 34cdeb5d32175e9e7d3c9d9bfb4f0aaf1e7fc112efb1e40dd52cc74d0e71abb2
  - module: github.com/aws/aws-sdk-go-v2/internal/v4a
    version: v1.5.3
    sha256sum: ae2c3903b5ce6d2363da1743cc4e3fe4364cdcdd7358cbc6b29e7075404f2e43
  - module: github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding
    version: v1.13.19
    sha256sum: cd55f71c785b8d9b08ae8eeb8d9803e38a4c6f4905c1cf9ff54a30f1cd5c858d
  - module: github.com/aws/aws-sdk-go-v2/service/internal/checksum
    version: v1.9.28
    sha256sum: aac3a9736ca1de77a4d533f755dc33b9969ca3bba56705a55f4081eaa808fdb8
  - module: github.com/aws/aws-sdk-go-v2/service/internal/presigned-url
    version: v1.14.3
    sha256sum: 80eb7bb3b353f93ba38c961750ec5e350bd07d68907dc76c8ea24705c75fa4a8
  - module: github.com/aws/aws-sdk-go-v2/service/internal/s3shared
    version: v1.19.36
    sha256sum: 0135568c0f618af560e4d7382537e030f65ec668a367d7ffec4d2f7f9c21cfb8
  - module: github.com/aws/aws-sdk-go-v2/service/kms
    version: v1.52.0
    sha256sum: efdf6a5f61b968c7f91598552648e2de379d69ceba4766af8af7f1a34022e38d
  - module: github.com/aws/aws-sdk-go-v2/service/s3
    version: v1.106.5
    sha256sum: 8356be140dca513460d336d2846ec9866c1512a78d8634e55d22ec30fa7efc84
  - module: github.com/aws/aws-sdk-go-v2/service/signin
    version: v1.10.0
    sha256sum: ae52f22eb436d1790b68553ea46067ab481d894bfc3b2349cd7561305dec8b4c
  - module: github.com/aws/aws-sdk-go-v2/service/sso
    version: v1.38.0
    sha256sum: c479a781b8f851a9e86c272c7fb96a83e17229f07cae05addfd8574ae373f414
  - module: github.com/aws/aws-sdk-go-v2/service/ssooidc
    version: v1.43.0
    sha256sum: 5b04bfe49ef9d167539bcbb4b4a9d768ea7baf6237e79bd6d8b005a3a336db7e
  - module: github.com/aws/aws-sdk-go-v2/service/sts
    version: v1.50.0
    sha256sum: 2a6519448722ff283eb3324dd3873aa71f955900edc5f5b0b27d577afb588d9c
  - module: github.com/aws/smithy-go
    version: v1.28.2
    sha256sum: 53b42a5130c244491eb4e48f098948b1148a3862ba6ba16761d67f001b55a9b9
  - module: github.com/beorn7/perks
    version: v1.0.1
    sha256sum: 25bd9e2d94aca770e6dbc1f53725f84f6af4432f631d35dd2c46f96ef0512f1a
  - module: github.com/blang/semver
    version: v3.5.1+incompatible
    sha256sum: 8d032399cf835b93f7cf641b5477a31a002059eed7888a775f97bd3e9677ad3c
  - module: github.com/cenkalti/backoff/v4
    version: v4.3.0
    sha256sum: ef220b1ebf3bff4c46bbad5b2e123030e812b722b9e9dc88bc35956f9c622c2a
  - module: github.com/cenkalti/backoff/v5
    version: v5.0.3
    sha256sum: 58e4d9014277bc1c5c7ab64539137923964cc3920303a4f771d02a532939bedb
  - module: github.com/cespare/xxhash/v2
    version: v2.3.0
    sha256sum: 145a26cdc7c49db566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3
  - module: github.com/clipperhouse/uax29/v2
    version: v2.6.0
    sha256sum: 684a37e245cd36c7a2bfa184ea339dfa1dda3dc828a58e0057147ad8c5531691
  - module: github.com/cloudflare/circl
    version: v1.6.3
    sha256sum: 9aed6385d52ccd66e0a3b8cc093b5f0e7744640485405dd08c8ef89ef6bbeb06
  - module: github.com/codahale/rfc6979
    version: v0.0.0-20141003034818-6a90f24967eb
    sha256sum: b15238554e2e66e045df44125055b8cf57fad45a0321b25b47c9fca48ecc8e32
  - module: github.com/compose-spec/compose-go/v2
    version: v2.16.1
    sha256sum: 175627961a4819edd5dc0e37ef93201c6cc69e0c47dd2709b26bd7d600020ada
  - module: github.com/containerd/cgroups/v3
    version: v3.1.3
    sha256sum: 44f3fecb3be9b7ac3cd7b538dc47e19109607a1b56eb961506eef64c34597cf4
  - module: github.com/containerd/console
    version: v1.0.5
    sha256sum: 79f70820b6e0901d405fe742945743e561f9aa3c2ec435f2d18ed5633bd85662
  - module: github.com/containerd/containerd/api
    version: v1.12.0
    sha256sum: 4ab15ee9c8ffe50c31cdc50cd6ea02f4e761bc7ff7a913092e0a6c6199344a6c
  - module: github.com/containerd/containerd/v2
    version: v2.4.2
    sha256sum: 4e40347c8cd23baf35e773109bd8499948d72f1638eff092ee10ed4f400e9b75
  - module: github.com/containerd/continuity
    version: v0.5.0
    sha256sum: bc1857ce83f4d08781284557b9b3a31e2044b2c8143c83494ac55ab90cf61a07
  - module: github.com/containerd/errdefs
    version: v1.0.0
    sha256sum: b4ef42c38d00f2c81cf3e69646549b7f5dc8fb72de9402d7b391963dc0ac9162
  - module: github.com/containerd/errdefs/pkg
    version: v0.3.0
    sha256sum: 593bf56f1991517e493510815d8fc6d344b8550fbfb3de56812f015096aab24f
  - module: github.com/containerd/fifo
    version: v1.1.0
    sha256sum: b139b81b236b29613edffca908d29753b9f49a4d2e3ea472e16162b4bfdcdbc2
  - module: github.com/containerd/log
    version: v0.2.0
    sha256sum: e12cd8035cf414f46e557a7e47e507780ed10e82e2e515c4f3eddd9c6b5839c2
  - module: github.com/containerd/log/otel
    version: v0.1.0
    sha256sum: 42828dda674560656a7e60bec959137d7c8da97dbd106ed36d7ee9b3dec0b98a
  - module: github.com/containerd/nydus-snapshotter
    version: v0.15.15
    sha256sum: d7cc4276f97a0fc0c2ffe5f91bad41a0d2e8b11c78ce68f1186a6fab8fe8aa3c
  - module: github.com/containerd/platforms
    version: v1.0.0-rc.5
    sha256sum: 94a3ea9af1dc123c10a494884987e33cfac04b8ebc09d057a2aa90fc95654977
  - module: github.com/containerd/plugin
    version: v1.1.0
    sha256sum: e1f803ef59e9194c5a092c37dd8d34a2e0c7a5c6c7afb6b04c4344b452b73c84
  - module: github.com/containerd/stargz-snapshotter
    version: v0.18.2
    sha256sum: 5d71cd438767e0de7d8540e18db1827c574cc86beb6b89591a9a850dfa0b640f
  - module: github.com/containerd/stargz-snapshotter/estargz
    version: v0.18.2
    sha256sum: 3ba05758c81ad89701d66bb34a9025e688d3e6b58784c2cbb4c6adfbae574435
  - module: github.com/containerd/ttrpc
    version: v1.2.10
    sha256sum: fb8d872f79e4d79bee2bcd88031db0a7cdb512fb59f390a4a0bb97275e82acbb
  - module: github.com/containerd/typeurl/v2
    version: v2.3.0
    sha256sum: 243aa4979ace10e7aff8300ccc32beb72460fb0afb1c9a51a72b79e0f4e1be22
  - module: github.com/coreos/go-oidc/v3
    version: v3.17.0
    sha256sum: fba667f687448a228315d6f0cfd00a5fa9ab8ad9b511e38575a699afc0b30aeb
  - module: github.com/cpuguy83/go-md2man/v2
    version: v2.0.7
    sha256sum: 9ad5f2cbc644c0bb648a9b182d6b70f92e7ac4dfab5cf0ef746bbeef944fda59
  - module: github.com/creack/pty
    version: v1.1.24
    sha256sum: 754e25253e76a5583b80d57d3add3afe68fc4d9f2a490968a9d1eda8c8fd8815
  - module: github.com/cyberphone/json-canonicalization
    version: v0.0.0-20241213102144-19d51d7fe467
    sha256sum: 9492fa89d9f2543890346672d239c494ccba4073be51f338b50e8f749792e25a
  - module: github.com/danieljoos/wincred
    version: v1.2.3
    sha256sum: a24ece3a299344e6c6cb45da1b5c147e6b14d074a8cfedd7d66488a63ca9dbd5
  - module: github.com/davecgh/go-spew
    version: v1.1.2-0.20180830191138-d8f796af33cc
    sha256sum: b4d0923b169b194f0016ec46f3df1ab0c68e27999743e43fe2de59ecb2484128
  - module: github.com/decred/dcrd/dcrec/secp256k1/v4
    version: v4.4.1
    sha256sum: 00ff35756d77aff4be22487a4b35819ff235371745b30475264ea8dcb04c37ca
  - module: github.com/dgraph-io/badger/v4
    version: v4.9.4
    sha256sum: c78e9d635dd5b6a83a8e61215972197adaac0e9b1cffa2cab57fe8fe66c60145
  - module: github.com/dgraph-io/ristretto/v2
    version: v2.2.0
    sha256sum: a556ffc80401dfaad3ae2420e6bd9e2ecc36dc28cd50717bf74c7caa4ada1af0
  - module: github.com/dgryski/trifles
    version: v0.0.0-20230903005119-f50d829f2e54
    sha256sum: 685448e350e2d0dbb88b7087a32edbba3645134ec257bb57f33ea96c98b9067c
  - module: github.com/digitorus/pkcs7
    version: v0.0.0-20230818184609-3a137a874352
    sha256sum: c4c8c4f4f331709c7c9dc40035fa0a9c23c98e8a7777cfaafe2013301e69bbfb
  - module: github.com/digitorus/timestamp
    version: v0.0.0-20231217203849-220c5c2851b7
    sha256sum: 0e79eb53bb9d500f26e33a58bb0cced31d72f91b3205c7685e6126cce267c683
  - module: github.com/distribution/reference
    version: v0.6.0
    sha256sum: 08232852a7a908263599777daab50e4306bd877e2467df036206367496122bcc
  - module: github.com/dlclark/regexp2
    version: v1.11.0
    sha256sum: 2a93432600feacb866669789bb7910ff283e1af764fcd03d70c6592f9619aeb4
  - module: github.com/docker/cli
    version: v29.8.2+incompatible
    sha256sum: 1c30bdd4f2ff12806ad00a5f47e8a0e7f70fec1e3381e2974f4457223fcf92f2
  - module: github.com/docker/cli-docs-tool
    version: v0.11.0
    sha256sum: b4802747380da9db5270f53b4e403f04570a37c3d24323cfa1ae52e911b40d4c
  - module: github.com/docker/distribution
    version: v2.8.3+incompatible
    sha256sum: 8f08722c5459cb4d9aa006e1fae094997da372098f4e14a59215b1ed3d48738a
  - module: github.com/docker/docker
    version: v28.5.2+incompatible
    sha256sum: eb2091e8336c55b1996489eccbc01c06b1b9fed028b5b38e0499b49c9fa0d468
  - module: github.com/docker/docker-credential-helpers
    version: v0.9.9
    sha256sum: 7394865bd1c09085b5931de2a9ac180fab5d888fe2e1e0694f527ebc807edd1e
  - module: github.com/docker/go-connections
    version: v0.8.1
    sha256sum: 5e442ebd8f4006f2bc0ef192dd4813da487f94d34a2aa662c5b9b964742e2565
  - module: github.com/docker/go-metrics
    version: v0.1.0
    sha256sum: d4d26c467123c71bbf75a3766968f72a3e1a7fe9c1800aa1387da3b7bd244593
  - module: github.com/docker/go-units
    version: v0.5.0
    sha256sum: 039d53ebe64af1aefa0be94ce42c621a17a3052c58ad15e5b3f357529beeaff6
  - module: github.com/dustin/go-humanize
    version: v1.0.1
    sha256sum: 319404ea84c8a4e2d3d83f30988b006e7dd04976de3e1a1a90484ad94679fa46
  - module: github.com/emicklei/go-restful/v3
    version: v3.13.0
    sha256sum: 06bd60484b324de0b8e4366d4ed326db2e1dc730459b46e19a5306a108439c77
  - module: github.com/felixge/httpsnoop
    version: v1.1.0
    sha256sum: e3405a361843f8e69f64e41b523512925cd50fd5ea108b7912534922c31b00e7
  - module: github.com/fortytw2/leaktest
    version: v1.3.0
    sha256sum: 867e6d131510751ba6055c51e7746b0056a6b3dcb1a1b2dfdc694251cd7eb8b3
  - module: github.com/foxcpp/go-mockdns
    version: v1.2.0
    sha256sum: 9079d831c848f584af90b17609501ba9228a5b8e5c99a8103a80f431e70f0f46
  - module: github.com/fvbommel/sortorder
    version: v1.2.0
    sha256sum: 5e4e0e12fd5f9d4e27f8283be03b399962aaac4e1dbde38b879e6ffc68cd2f61
  - module: github.com/fxamacker/cbor/v2
    version: v2.9.4
    sha256sum: e7ed6a1be5e6d17bb123e20d5901fc72d2fc3a8ee384731fbbd697d4e7ce8022
  - module: github.com/go-chi/chi/v5
    version: v5.3.0
    sha256sum: d7e7d7f765a93066c27b3df35494588dbf322587439b75056d88a32a0b3983ec
  - module: github.com/go-jose/go-jose/v4
    version: v4.1.5
    sha256sum: 0187ade1d4dd731fc0de8d972aeddd156f8f930e628f1f0badc252e5579db4c8
  - module: github.com/go-logr/logr
    version: v1.4.4
    sha256sum: 3ab107c1d280ce798eaa744efd595982fa709d4023f3f38d24189827483c1710
  - module: github.com/go-logr/stdr
    version: v1.2.2
    sha256sum: 9dd6893bf700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef
  - module: github.com/go-openapi/analysis
    version: v0.25.5
    sha256sum: 78ed5b158531cce2705f3759e3d2551278324962c266b1781ad787ec590124be
  - module: github.com/go-openapi/errors
    version: v0.22.8
    sha256sum: 29105371e583abec5440063d20b77c67f67bf6b017c959c88934a5da6e65ae92
  - module: github.com/go-openapi/jsonpointer
    version: v1.0.0
    sha256sum: 403cc887595921a24880a173862ea95b7c46f0747725d7b75c31165e0647e157
  - module: github.com/go-openapi/jsonreference
    version: v1.0.0
    sha256sum: 381714f9c672c76e573155e6e6fb38ab1ccceafba6163d672a52d4460a999f5b
  - module: github.com/go-openapi/loads
    version: v0.25.0
    sha256sum: 309d12a74ca10eacfe6d73a3b1f91a7fd4c5d30609bddb48afb05e101c3ac361
  - module: github.com/go-openapi/runtime
    version: v0.33.0
    sha256sum: 2dd8da0f7ef92b99af6d02a682214373252b862120dbbb5692699a2f29e44bcf
  - module: github.com/go-openapi/runtime/server-middleware
    version: v0.30.0
    sha256sum: afc8dcdb7add7673b1a89215cd419d15d84bfeb1f62da9162c55b5a3fe736e58
  - module: github.com/go-openapi/spec
    version: v0.22.9
    sha256sum: e99c84955b8268d1552d5a77ccaec6a9c92c5c397aeaa52ee693636b6be5cafd
  - module: github.com/go-openapi/strfmt
    version: v0.27.0
    sha256sum: 6e830c668d22047156cd9d1e991e9e2603a55fd2fbd7331ee2e4691e9646797e
  - module: github.com/go-openapi/swag
    version: v0.28.0
    sha256sum: 3d8ca6e12ec2e0ca5e14be6f2688cfb3005878b799d42fbe3828e293d375dd5b
  - module: github.com/go-openapi/swag/cmdutils
    version: v0.28.0
    sha256sum: ec8d7c8093e697ab5aa09eb1c7644bc02f9bb48d2cd00278a1c851001c6f82c4
  - module: github.com/go-openapi/swag/conv
    version: v0.28.0
    sha256sum: 0869a899afe4cdc64843f06a45cc9fe4feddb47be187e223730ffe4b57de854b
  - module: github.com/go-openapi/swag/fileutils
    version: v0.28.0
    sha256sum: 282c501d0d2f2539c5ea0ae18fcd0b3b544d958b91b483404426717610ffcacb
  - module: github.com/go-openapi/swag/jsonutils
    version: v0.28.0
    sha256sum: 9ec1021cfa869bcf862ec8a36b166c46ebbb47f736e2bb8fa2a6685b83170e34
  - module: github.com/go-openapi/swag/jsonutils/fixtures_test
    version: v0.28.0
    sha256sum: 0b82d33f96dcb4c5c1c159d2c2dce2028588852c2b63a136499b7b4344ecbf9a
  - module: github.com/go-openapi/swag/loading
    version: v0.28.0
    sha256sum: 63c459ca5289190b2a231c05aff1d22710bab0f50c33a49fe5f0c6cb218612a0
  - module: github.com/go-openapi/swag/mangling
    version: v0.28.0
    sha256sum: 2d16f070918e2fd8714aaf356dfb9984e84daf7643689a8e25cc58d5ded54b70
  - module: github.com/go-openapi/swag/netutils
    version: v0.28.0
    sha256sum: d7363cce443a04264c352c76d34d89d0993e7e299319b25c00854d7ab865672a
  - module: github.com/go-openapi/swag/pools
    version: v0.28.0
    sha256sum: 623705ee11fe884b4a998ca0e8305c4da03ada2f43c3b4c41e1f84486e627049
  - module: github.com/go-openapi/swag/stringutils
    version: v0.28.0
    sha256sum: e15348c48de427f551dc69583eb088a72510c257cf976f6ab382601ec602ab6c
  - module: github.com/go-openapi/swag/typeutils
    version: v0.28.0
    sha256sum: 9256dec49a60a1efca39e0486107c7d86d15f7c52c962cfb9a04a720023e3e0d
  - module: github.com/go-openapi/swag/yamlutils
    version: v0.28.0
    sha256sum: 66bffa6d57cfc00135695b8d873f08d11c6017f472aa00b777dd168b3ecec2c3
  - module: github.com/go-openapi/testify/enable/yaml/v2
    version: v2.6.0
    sha256sum: 985eeb1d1df3582dded573d476253753e81de708a3d47b36721acd3114b3439f
  - module: github.com/go-openapi/testify/v2
    version: v2.6.0
    sha256sum: bcee6bf36660ceb6cc307e5302e4ff7087f26df7f7ee7c591a7b0c5d19024f72
  - module: github.com/go-openapi/validate
    version: v0.26.1
    sha256sum: c9a7e3f8cd420729d9d89d4785dcadbb46a3a1918815119bfbf3d07208983d38
  - module: github.com/go-test/deep
    version: v1.1.1
    sha256sum: 52844b1cc8b3e4e5613bef80f0f88b02d73edb3c6b24d58f14a20c76d86cb2dc
  - module: github.com/go-viper/mapstructure/v2
    version: v2.5.0
    sha256sum: 326f8e00f648af4ae8e6e18c606325e4206a92d6ed42f486dc2f4da8e1897547
  - module: github.com/gobwas/glob
    version: v0.2.3
    sha256sum: 0cfe486cd63d45ed4cb5863ff1cbd14b15e4b9380dcbf80ff26991b4049f4fdf
  - module: github.com/goccy/go-json
    version: v0.10.6
    sha256sum: 2296e77cc44facf3596ddd7a5866578a8450b59ad1583cbb70bfbfa77fe0dadc
  - module: github.com/godbus/dbus/v5
    version: v5.1.0
    sha256sum: 03dfa8e71089a6f477310d15c4d3a036d82d028532881b50fee254358e782ad9
  - module: github.com/gofrs/flock
    version: v0.13.1
    sha256sum: 2d8bab9666100e0b92ff6dfa9054be287feb295fababc4eb2daeef94cb7c033c
  - module: github.com/golang-jwt/jwt/v5
    version: v5.3.1
    sha256sum: 5c9a74494e2bc746cee56558b5473252af5767f7ea4044caa9ea0fa2a056fec7
  - module: github.com/golang/protobuf
    version: v1.5.4
    sha256sum: 9a2f43d3eac8ceda506ebbeb4f229254b87235ce90346692a0e233614182190b
  - module: github.com/golang/snappy
    version: v1.0.0
    sha256sum: d712fef567e361d17e879f80ea53ebfdf529185a6bc74a2aa1996133ddd0a930
  - module: github.com/google/certificate-transparency-go
    version: v1.3.3
    sha256sum: 2728bdcc12bd62dfa29cbc5211dd4e25ca471a806dd0ab2400177a9a45733641
  - module: github.com/google/flatbuffers
    version: v25.2.10+incompatible
    sha256sum: 5f740234a99d0975da38a3c3647c51a5cc8a1991041d6e807f34046331671de6
  - module: github.com/google/gnostic-models
    version: v0.7.0
    sha256sum: 797a05cd73a30624ece79633c4db4631676adc1f30f07a0a7051ab39beca96c8
  - module: github.com/google/go-cmp
    version: v0.7.0
    sha256sum: 64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b67bf27f7630919db3f539
  - module: github.com/google/go-containerregistry
    version: v0.21.7
    sha256sum: 70c92eaefc68579adcd49cd95cdfab663b6fd82bf83ea40eb0e2c8ce09c0b8e6
  - module: github.com/google/go-dap
    version: v0.12.1-0.20250904181021-d7a2259b058b
    sha256sum: b9eda3537b717229926ae927f841678cb6612c90a2f963f3943a019629235081
  - module: github.com/google/s2a-go
    version: v0.1.9
    sha256sum: bf8f4b159d3fc201477822ed2514e4f05f58c764b78ffed73ec0accce5fb7f07
  - module: github.com/google/shlex
    version: v0.0.0-20191202100458-e7afc7fbc510
    sha256sum: 1bf70bdb4c889b47b1976370832da79060c36cad282f278f279603200623775c
  - module: github.com/google/trillian
    version: v1.7.3
    sha256sum: e51b7846c0015b0a88d60313378409e7bf1c7da2b1a0314cecff9d7fddfca6eb
  - module: github.com/google/uuid
    version: v1.6.0
    sha256sum: d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed
  - module: github.com/googleapis/enterprise-certificate-proxy
    version: v0.3.16
    sha256sum: 9f89b25bac2b21bc32cb884fda82e62ea5ed582468e4aa82eed78da6e1dc3494
  - module: github.com/googleapis/gax-go/v2
    version: v2.22.0
    sha256sum: 800a18188bf1222e7ce7b4a31c22ab807136e6d194507aa8cd822ba9dff00696
  - module: github.com/gorilla/mux
    version: v1.8.1
    sha256sum: 728243623caa67f64e4a0b6c59dde3f762918d9e729266167ba46d8df56c193a
  - module: github.com/gorilla/websocket
    version: v1.5.4-0.20250319132907-e064f32e3674
    sha256sum: 81809e9741b37f386c8d28c9c6a23511f4a2465fd024a690a4c44a439e32e832
  - module: github.com/grpc-ecosystem/go-grpc-middleware
    version: v1.4.0
    sha256sum: e4e1845280f93ea81648d0e48d3c17e6610c7916a49171f73c150fbde8fa9bc0
  - module: github.com/grpc-ecosystem/grpc-gateway/v2
    version: v2.30.0
    sha256sum: e76534d0b9df3124c4d3c20378789db52bf700a5d8c4d8db7beeef49bf372980
  - module: github.com/hashicorp/errwrap
    version: v1.1.0
    sha256sum: 209ae99bc039443e28e4d6bb66517d1756d9468b7578d31f1b63a28103d8e18c
  - module: github.com/hashicorp/go-cleanhttp
    version: v0.5.2
    sha256sum: e9f3dcfcb33172ba499b4f8e888169252d7f1e072082182124a6e2053523f7df
  - module: github.com/hashicorp/go-cty-funcs
    version: v0.0.0-20250818135842-6aab67130928
    sha256sum: 2327c2ddc72ca6a0c8d88b7fd360f27dbc0e168d8a9f21d95a4d36a2890666f3
  - module: github.com/hashicorp/go-multierror
    version: v1.1.1
    sha256sum: 972cd841ee51fdeac69c5a301e57f8ea27aebf15fddd7f621d5c240f28c3000c
  - module: github.com/hashicorp/go-retryablehttp
    version: v0.7.8
    sha256sum: 9e2c175e4af37cdfeba28ed89250ad1fd691eda0fab167fafa9928222646b71e
  - module: github.com/hashicorp/go-rootcerts
    version: v1.0.2
    sha256sum: 864a48e642e87a273fb5ef60bb3575bd74a7090510f93143163fa6700be31948
  - module: github.com/hashicorp/go-secure-stdlib/parseutil
    version: v0.2.0
    sha256sum: 715aecec5d925467704774d3ab4bd3c4eead5ddb525a4bceb06c6f1e697ddba8
  - module: github.com/hashicorp/go-secure-stdlib/strutil
    version: v0.1.2
    sha256sum: 8070c67bc97e15488b99b172ddb6631412dca0fcb8cea90e37fe55d95e1af00a
  - module: github.com/hashicorp/go-sockaddr
    version: v1.0.7
    sha256sum: 53ea8d77b68056fe7f40a53338aa73ed6ddca9558fe1156804070a060f1a930f
  - module: github.com/hashicorp/hcl
    version: v1.0.1-vault-7
    sha256sum: 84fea514e70253c65e3caf90a8d9f366808bdfb4099914d1e6ab0d1fdba976b7
  - module: github.com/hashicorp/hcl/v2
    version: v2.24.0
    sha256sum: 53fd4e96ac9c190e192759daf49b63397865214d337ab5f6dbf6e68c1b0f4810
  - module: github.com/hashicorp/vault/api
    version: v1.22.0
    sha256sum: ca415b5364f49dadb17be1bc60f156c9f5cd6579a2e0711b069b3418c3a2265e
  - module: github.com/hiddeco/sshsig
    version: v0.2.0
    sha256sum: f1acfab01317d2d1d9b269774de433993e452659ece865ad4009692d06e5a9a3
  - module: github.com/howeyc/gopass
    version: v0.0.0-20210920133722-c8aef6fb66ef
    sha256sum: 00098a455d6323b0124492626ce50bfa4552d3fcccffb5b85232f795d76eb8cf
  - module: github.com/in-toto/attestation
    version: v1.2.0
    sha256sum: 755f95c2361aed959041c47cb145c3e98130c7b038506c2c9206a72f6f0a1f6a
  - module: github.com/in-toto/in-toto-golang
    version: v0.11.0
    sha256sum: eb4aa5358ed3ffc9ce44e82bb04fe03d1d8af6ae8e441b82c2b8bf64be78b2aa
  - module: github.com/inconshreveable/mousetrap
    version: v1.1.0
    sha256sum: 526674de624d7db108cfe7653ef110ccdfd97bc85026254224815567928ed243
  - module: github.com/jedisct1/go-minisign
    version: v0.0.0-20211028175153-1c139d1cc84b
    sha256sum: 98ca8b8fde47dd712a1ad7e536c84fdcb0f39e337951c80ccfb115494ae2bd8b
  - module: github.com/jellydator/ttlcache/v3
    version: v3.4.0
    sha256sum: b3f31d5c4ea68698f1de6f85dbaacb176b2fadeaa6d426a38f48f4f752f974fb
  - module: github.com/json-iterator/go
    version: v1.1.12
    sha256sum: d001ea57081afd0e378467c8f4a9b6a51259996bb8bb763f78107eaf12f99501
  - module: github.com/klauspost/compress
    version: v1.20.2
    sha256sum: f85b4729a966a3d0313310482a11b585f0be445a20b2ea0c967937fe14c17acc
  - module: github.com/kr/pretty
    version: v0.3.1
    sha256sum: ecf5a4af24826c3ad758ce06410ca08e2d58e4d95053be3b9dde2e14852c0cdc
  - module: github.com/kr/text
    version: v0.2.0
    sha256sum: 368eb318f91a5b67be905c47032ab5c31a1d49a97848b1011a0d0a2122b30ba4
  - module: github.com/kylelemons/godebug
    version: v1.1.0
    sha256sum: dbbd0ce8c2f4932bb03704d73026b21af12bd68d5b8f4798dbf10a487a2b6d13
  - module: github.com/lestrrat-go/blackmagic
    version: v1.0.4
    sha256sum: 4775ca8eab443a882cc1772c25716810a889d478746c6a405f559750de42dce6
  - module: github.com/lestrrat-go/dsig
    version: v1.2.1
    sha256sum: 08bc6c4b409ecdef7a1a9772d6890128d47d9eaccaf4fb279b3016274633c12c
  - module: github.com/lestrrat-go/dsig-secp256k1
    version: v1.0.0
    sha256sum: 1d1dbde8d45f731b491fe1de12eeb18ceea0b3bb32592c29f2f545f81cdcf364
  - module: github.com/lestrrat-go/httpcc
    version: v1.0.1
    sha256sum: d75132f805ea5cf6275d9af02a5ff3c116ad92ac7fc28e2a22b8fd2e029a3f4c
  - module: github.com/lestrrat-go/httprc/v3
    version: v3.0.5
    sha256sum: b9c165427fbdf8ccd820e7667fb893e55237bd45582a8997682255b1fd86ea6f
  - module: github.com/lestrrat-go/jwx/v3
    version: v3.1.1
    sha256sum: 682231ff5db749769b714c09b5e646a4204349beaf824e8f56112c18c4aa3a44
  - module: github.com/lestrrat-go/option/v2
    version: v2.0.0
    sha256sum: 3456bd01638c67da62570123f3d12f5996d0a01ed521959c2fc85aa83d3ee94a
  - module: github.com/letsencrypt/boulder
    version: v0.20260309.0
    sha256sum: 00fa88114754211e263f4761a9b82df76b4d3b7827376cf68baeb58c8706e573
  - module: github.com/mattn/go-runewidth
    version: v0.0.29
    sha256sum: 147e17eb8bed3777d475705ee7a8b12fbd39843317fda4fd76216b6150cf10b2
  - module: github.com/mattn/go-shellwords
    version: v1.0.13
    sha256sum: 275bc80137082affa209b71f0e98aa78c3bf293af1d789d14b193245eac83ba2
  - module: github.com/miekg/dns
    version: v1.1.57
    sha256sum: 50750ca3ebe181f8c16a3d5ccdbc4f7fe864ba6c731a8013d4df8678f901e1f6
  - module: github.com/mitchellh/go-homedir
    version: v1.1.0
    sha256sum: fffec361fc7e776bb71433560c285ee2982d2c140b8f5bfba0db6033c0ade184
  - module: github.com/mitchellh/go-wordwrap
    version: v1.0.1
    sha256sum: 5f96426c4b3b3e90a9b7471568cb1d61d6a306744f5d4765a30fa8a61e1c0b47
  - module: github.com/mitchellh/mapstructure
    version: v1.5.0
    sha256sum: 118d5b2cb65c50dba967fb6d708f450a9caf93f321f8fc99080675b2ee374199
  - module: github.com/moby/buildkit
    version: v0.34.2
    sha256sum: d491e17052d6e45779fda89eeab5d41f157da373e963931f010dac650c7ebdfc
  - module: github.com/moby/docker-image-spec
    version: v1.3.1
    sha256sum: e3fe212be410465c0cae032baa7e2c7282b9bb878f081f00549333edc260c306
  - module: github.com/moby/go-archive
    version: v0.2.0
    sha256sum: 9fa1f9c9076a5d614e0fe1519878b49f0ae6221203d1b41c8e1710344783d345
  - module: github.com/moby/locker
    version: v1.0.1
    sha256sum: f07361346d12a24e168db7fb2f21281883bee6060f1aedf7507bccf20c4a793f
  - module: github.com/moby/moby/api
    version: v1.56.0
    sha256sum: c37d978e3626ae7f767a7fd008d4de06236750db160130c85422986964c3a72e
  - module: github.com/moby/moby/client
    version: v0.6.0
    sha256sum: 2becd1818d706245e52364d830e04dae2d27d8199695ef84ed55bc7215a6fc95
  - module: github.com/moby/patternmatcher
    version: v0.6.1
    sha256sum: 63143eefbfab2697750be63bc4be899b2607538b3b1fb8e862ced521f7f9545f
  - module: github.com/moby/policy-helpers
    version: v0.0.0-20261006174519-bd98f4747414
    sha256sum: bdbb68a29fc232c8d348ec462210aac3022091d830a862a3284a43815ba2f04a
  - module: github.com/moby/spdystream
    version: v0.5.1
    sha256sum: f4cdb9929a3327708b04dbbb4b6f15e1a21b7919e5c59e5b18bc049bb033d688
  - module: github.com/moby/sys/atomicwriter
    version: v0.1.0
    sha256sum: a43a7148f3866be0752c515f32bd9ca1c96a4cc336b7e61af31932ee434da873
  - module: github.com/moby/sys/mountinfo
    version: v0.7.2
    sha256sum: 94f79687bc3b72ca4cc60fafda851454fefc0ef04bdb4499e8c7c2b2e231b5d3
  - module: github.com/moby/sys/sequential
    version: v0.7.0
    sha256sum: 7079b80c6b1ce943a924f1b6daa9fc05ba8ce1c6e37da354dca5aada6510291b
  - module: github.com/moby/sys/signal
    version: v0.7.1
    sha256sum: 8c3853bc4ba4f283f7fccde5c548e93c3613db46f5209394a60cdbbc3eaf4f42
  - module: github.com/moby/sys/user
    version: v0.4.1
    sha256sum: acfdb68bda18ee112adacf55e0b20752a1f5633c55fb020f2a10a9b2eeaec46a
  - module: github.com/moby/sys/userns
    version: v0.2.1
    sha256sum: fd69e7793f9753dc0e5b6c6f600ebbbf3b613d5356fe862110fe811e6544f746
  - module: github.com/moby/term
    version: v0.5.2
    sha256sum: f8d6e5c53992c640512ee45a9b6147a765bebe3d8d50e3bfe1e4ec3e052cd688
  - module: github.com/modern-go/concurrent
    version: v0.0.0-20180306012644-bacd9c7ef1dd
    sha256sum: 91ef49599bec459869d94ff3dec128871ab66bd2dfa61041f1e1169f9b4a8073
  - module: github.com/modern-go/reflect2
    version: v1.0.3-0.20250322232337-35a7c28c31ee
    sha256sum: 49f3fb0f76b1b98b52b5e6e8eab2a48454eab33904b937625941c28138a7fea4
  - module: github.com/morikuni/aec
    version: v1.1.0
    sha256sum: 3d50f78078455e310a5df2f0fb5aaf3d50e1f0d52efe66f7d60635700612b392
  - module: github.com/munnerz/goautoneg
    version: v0.0.0-20191010083416-a7dc8b61c822
    sha256sum: 3d7ce17916779890be02ea6b3dd6345c3c30c1df502ad9d8b5b9b310e636afd9
  - module: github.com/natefinch/atomic
    version: v1.0.1
    sha256sum: 25df4a9727bd8750557a848d9066503c2e0b1788821be4db87377fd202254ed4
  - module: github.com/oklog/ulid/v2
    version: v2.1.1
    sha256sum: 312b5fea3f68df920adaffc327440efbaba43ad6a8df2f7e0c9e365743f6ff89
  - module: github.com/open-policy-agent/opa
    version: v1.19.0
    sha256sum: 70d07bec2c2da760f389d0daa930c19319d873513387861db77d1aef766182dd
  - module: github.com/opencontainers/go-digest
    version: v1.0.0
    sha256sum: 615efb31ff6cd71035b8aa38c3659d8b4da46f3cd92ac807cb50449adfe37c86
  - module: github.com/opencontainers/image-spec
    version: v1.1.1
    sha256sum: 3a32eeb459719172947c20be78b5b7293c6ea84f4039184e846f6b676bc19574
  - module: github.com/opencontainers/runtime-spec
    version: v1.3.0
    sha256sum: 09e58e616eb70f2972ed19ada447dd661b298b39777adb0bbd35c94886bdbdf8
  - module: github.com/package-url/packageurl-go
    version: v0.1.7
    sha256sum: 61a9ea183ca003f2280867dc1e10c9b8910e61f65045670a72d36722b0ea5fcf
  - module: github.com/pelletier/go-toml/v2
    version: v2.4.3
    sha256sum: bc0de16d4942df8503be13bde0447e0b7ce1694f3bb1b840f485ce839f8974cf
  - module: github.com/pkg/browser
    version: v0.0.0-20240102092130-5ac0b6a4141c
    sha256sum: 8524ae36d809564d1f218978593b5c565cf3ee8dccd035d66b336ad0c56e60d1
  - module: github.com/pkg/errors
    version: v0.9.1
    sha256sum: d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07
  - module: github.com/planetscale/vtprotobuf
    version: v0.6.1-0.20240319094008-0393e58bdf10
    sha256sum: 6fdbac53c6ace58d732be8ec29c1aae928639eb12960cc4c52a9f7a25395ca05
  - module: github.com/pmezard/go-difflib
    version: v1.0.1-0.20181226105442-5d4384ee4fb2
    sha256sum: 24ff45e356f638a53bd0c89fff961fbeaecfdb0dc5e482ceed0a2230e0e5f3b7
  - module: github.com/prometheus/client_golang
    version: v1.24.1
    sha256sum: 90b627e392d9936cf410ed23066d6198fecc11130bbab2e17dda627da3a86fc3
  - module: github.com/prometheus/client_model
    version: v0.6.3
    sha256sum: 92f5d9a39b75bdc3f6733563934438148a3c3661420a8f742fea8cbf40d39abe
  - module: github.com/prometheus/common
    version: v0.71.0
    sha256sum: d78a22ba3919910cb3bc8a1953b1e0b930f16363c6ca6d13d613e4845f921716
  - module: github.com/prometheus/otlptranslator
    version: v1.0.0
    sha256sum: b4a3a9d8b0dfd8d7a54937d6916beb08108e57afdd8f0e21544a0d163181ffb4
  - module: github.com/prometheus/procfs
    version: v0.21.1
    sha256sum: b417ab3081ad334ce4c6b367b2d5e74dea49e2eb3b5431c1dd5a65e1256736f9
  - module: github.com/rcrowley/go-metrics
    version: v0.0.0-20250401214520-65e299d6c5c9
    sha256sum: a8c9e9792ad16f31ef8c32232de6243cc02147175661c9f64bc7b292f1c4d0cc
  - module: github.com/rogpeppe/go-internal
    version: v1.15.0
    sha256sum: c84d958181618407e61f0f837c0a226016cc7bb0de6d26d2d82fd476e3bf1f70
  - module: github.com/russross/blackfriday/v2
    version: v2.1.0
    sha256sum: 7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d7004c6ae
  - module: github.com/ryanuber/go-glob
    version: v1.0.0
    sha256sum: 2084f36ead38a505489fdb46329502fb627f568224dcc22ef11ec173b61fc2cf
  - module: github.com/santhosh-tekuri/jsonschema/v6
    version: v6.0.3
    sha256sum: 79282583888de6fd146e513f01e09bd3b228976942d2114688e97608279b1ebe
  - module: github.com/sassoftware/relic
    version: v7.2.1+incompatible
    sha256sum: c28fccce743db96510662f1d45f8a4b2212f5f60fb4a4f31a99261118ed068f3
  - module: github.com/sassoftware/relic/v7
    version: v7.6.2
    sha256sum: 5d6adadad16cd36621951427edad76056535c4513361cb078ad3d5e764bb4e8e
  - module: github.com/secure-systems-lab/go-securesystemslib
    version: v0.11.0
    sha256sum: bcc6c768b802666b5ad3aea122e15b34049655e5e8934c1e2a3e65b1fb59e692
  - module: github.com/segmentio/asm
    version: v1.2.1
    sha256sum: 04ee03ed0972329c3c8fa1cd57a30397be37b82f3e2ba2251d56ba9c6fbc1d99
  - module: github.com/sergi/go-diff
    version: v1.4.0
    sha256sum: 63aef1860b251af1421ba0a014a6bb08a60833f13f948f3d88d66754bb484f53
  - module: github.com/serialx/hashring
    version: v0.0.0-20200727003509-22c0c7ab6b1b
    sha256sum: 23dc67499d52b7b55a5a8f9d35e976052166da0cd0d499c1cc8be041e56789a4
  - module: github.com/shibumi/go-pathspec
    version: v1.3.0
    sha256sum: 1ac9091ebe9ff4154ddc39b2b3436c5b6b268d5cdc1e8462c9790485cd76a58f
  - module: github.com/sigstore/protobuf-specs
    version: v0.5.1
    sha256sum: 437d3a7a3ac89db1ba4886999dcaef9310876dfd9ee6d1b76d3407fd96974591
  - module: github.com/sigstore/rekor
    version: v1.5.3
    sha256sum: f78e5fb078e3b38097395cc940bc524616c6ba597ad5d00fde022869a9985a16
  - module: github.com/sigstore/rekor-tiles/v2
    version: v2.3.0
    sha256sum: 5b8f617e17ceb7684643daf95facbb020cfd302d4178e0a0d9d9a8239e59bd48
  - module: github.com/sigstore/sigstore
    version: v1.10.8
    sha256sum: 0e7c054133f3eeafdccec2c059457bf4a9e10721c8e8f076a41f5b45f63fc5f2
  - module: github.com/sigstore/sigstore-go
    version: v1.2.2
    sha256sum: 79fcef099b900093796e106ad46b08d6f15a58f72ef4320107f6ffb6051c522b
  - module: github.com/sigstore/sigstore/pkg/signature/kms/aws
    version: v1.10.8
    sha256sum: e706667839e97c9e26fb6c657a9f6b8d180240d2da95552cc272a9294160de96
  - module: github.com/sigstore/sigstore/pkg/signature/kms/azure
    version: v1.10.8
    sha256sum: 328c0ed6d93f03f679e6019448ad6dafddcf384103bcf09e1280cb764360087f
  - module: github.com/sigstore/sigstore/pkg/signature/kms/gcp
    version: v1.10.8
    sha256sum: 88d37bd11813b48dd1e86001e02f01aaefbe8031ba5db999d9e95ba64d167190
  - module: github.com/sigstore/sigstore/pkg/signature/kms/hashivault
    version: v1.10.8
    sha256sum: 27fe463d37a0b264da08eab04679e309cff77b7292fcfb079be47de632ce1883
  - module: github.com/sigstore/timestamp-authority/v2
    version: v2.1.2
    sha256sum: 4315fc3adc84e6e8f730887a10c423fb65fd5093ef681ea5a64ab7b534134987
  - module: github.com/sirupsen/logrus
    version: v1.10.2
    sha256sum: 73a40737da86682dd536ec2c87dff0f589eeeed81873362b08ed009818747b52
  - module: github.com/spdx/tools-golang
    version: v0.5.7
    sha256sum: 32878e7a65f75f87dc89375504f0e5950c2a9881eeeee1ebcf4721bc5d4dc81c
  - module: github.com/spf13/cobra
    version: v1.10.2
    sha256sum: a00aae6fcd631e0fde52c98604452ff70e1b73c3b8a560d68db15aff5e26872d
  - module: github.com/spf13/pflag
    version: v1.0.10
    sha256sum: a246b8c9d3daa87d6c634cdfee1bdf7fa53d5817eeef4fa0c6da43edd12de4ca
  - module: github.com/stretchr/objx
    version: v0.5.3
    sha256sum: cdc804051b06efceea75ee9b0b6349d2f92f17cd46c6193c4a8dfb0f51465a44
  - module: github.com/stretchr/testify
    version: v1.12.1
    sha256sum: 6874ed1c4b0b7e9feb27989b16c179b36590020633436ae260cefc5f5565589f
  - module: github.com/tchap/go-patricia/v2
    version: v2.3.3
    sha256sum: 37591393b0ea113849eacbc292886ea6978798a596164510c5834c2edc374067
  - module: github.com/tetratelabs/wazero
    version: v1.12.0
    sha256sum: dcee360162e809d1273c685d20f6faf6df7ae0d925a73bf8f1af1a4756bfe587
  - module: github.com/theupdateframework/go-tuf
    version: v0.7.0
    sha256sum: 5c2c631a720e3c4225cfff085bd080acabd4308d0e4e6244e4cc180e019b8eaa
  - module: github.com/theupdateframework/go-tuf/v2
    version: v2.4.2
    sha256sum: 2dbb43998311a484bac172503b6c62df8bb7c7e5a6333c7b63356ca3aadf0a8d
  - module: github.com/tink-crypto/tink-go-awskms/v3
    version: v3.0.0
    sha256sum: 01478890990389f90caecdf0f45fe1b78b017579e023f7a3db6893c463cf1cd6
  - module: github.com/tink-crypto/tink-go-gcpkms/v2
    version: v2.2.0
    sha256sum: 9540be65d4d4eaa0aa532d3c3c052bf126d34255132fb313819a74dc63ba2d19
  - module: github.com/tink-crypto/tink-go-hcvault/v2
    version: v2.5.0
    sha256sum: a77e7e748f391e7b35ac37663bf80332eb6d06f6d8830d3c9215ab8d167bf60c
  - module: github.com/tink-crypto/tink-go/v2
    version: v2.6.0
    sha256sum: 72d387103aa5b695892226f84950163a3ad82347b1176917b4a67c91c936f9fa
  - module: github.com/titanous/rocacheck
    version: v0.0.0-20171023193734-afe73141d399
    sha256sum: 00e4f6d7d6a6a424539afb3968c2c9cfd9b42eca089015d67e90358b91e7f8da
  - module: github.com/tonistiigi/dchapes-mode
    version: v0.0.0-20250318174251-73d941a28323
    sha256sum: 251cf604bd1301b75e8dc6d3f6061fccd250f4b3648813ba57793cac799c91ed
  - module: github.com/tonistiigi/fsutil
    version: v0.0.0-20261103091533-a72de9dcf763
    sha256sum: ebc1c287e90f3f33706b5d54fcdbae2615b0e271210813f76d44bfa2c3c1d421
  - module: github.com/tonistiigi/go-csvvalue
    version: v0.0.0-20240814133006-030d3b2625d0
    sha256sum: 51bce4d81fe31cb3edfcfaa124a74e2cff5ef08ed8d6f54afb054b39dc0ed89a
  - module: github.com/tonistiigi/jaeger-ui-rest
    version: v0.0.0-20250408171107-3dd17559e117
    sha256sum: e7597599b676a442100ccc97cd871a8f20bf24580e25b92d225063356b787207
  - module: github.com/tonistiigi/units
    version: v0.0.0-20180711220420-6950e57a87ea
    sha256sum: 79524e0da4048adabf5fd4ca21bfca226ab45a601c5ec9d299f0e0385814b0e6
  - module: github.com/tonistiigi/vt100
    version: v0.0.0-20240514184818-90bafcd6abab
    sha256sum: de7d217ec5bf807a23eabce963d56d73f7975f754eb8bc3321b354d34f340af3
  - module: github.com/transparency-dev/formats
    version: v0.1.1
    sha256sum: badaeecbae532b3e8f23bc07b4b4e40b1a80951b62f69e0ac0523aab0da4a5ec
  - module: github.com/transparency-dev/merkle
    version: v0.0.2
    sha256sum: bff8072eb052d166df4f8f3d144451ca83b98f1c0382995167008c44abc383fd
  - module: github.com/valyala/fastjson
    version: v1.6.10
    sha256sum: 9b4ec65a79a668f4948baf45f53d127f6c36cd37f78c1f5cfee672bd377afce7
  - module: github.com/vbatts/tar-split
    version: v0.12.3
    sha256sum: c1eb652b555939db8438ac0b71271d2eb3b65e5650d12e4c127f00577016fc07
  - module: github.com/vektah/gqlparser/v2
    version: v2.5.36
    sha256sum: 25c8b59d3da59a5ba59fcc8f128eef1d1e2a3199c7fec425d8e13234b80db482
  - module: github.com/x448/float16
    version: v0.8.4
    sha256sum: 73b24a41037ea999ab66851e3798a0973dbb1f214925915b01f0820f7b2f1500
  - module: github.com/xeipuuv/gojsonpointer
    version: v0.0.0-20190905194746-02993c407bfb
    sha256sum: 11b54f0bc358b09261075c3e15cd14d57102f3ab1ba88c345c53eab6aaf228de
  - module: github.com/xeipuuv/gojsonreference
    version: v0.0.0-20180127040603-bd5ef7bd5415
    sha256sum: 7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7
  - module: github.com/xhit/go-str2duration/v2
    version: v2.1.0
    sha256sum: 907db1bdf362568191e659f82339c21a4031d433bc5ac52f36de23eeceb8cb26
  - module: github.com/yashtewari/glob-intersection
    version: v0.2.0
    sha256sum: bc999bc9a3bcce0ed7c06180320d2236a5c32aa61def5a7c79963faa6bcf2fd0
  - module: github.com/youmark/pkcs8
    version: v0.0.0-20240726163527-a2c0da244d78
    sha256sum: cdcf5e96850f9f60bc96ab512e4bd06ee19dd2dbe855260c3589c6c79a1bcfb5
  - module: github.com/zalando/go-keyring
    version: v0.2.3
    sha256sum: 0ff2578cadb1591438ea84765e08a83e7d4f5ba4dfb85060adef8ffcfb371124
  - module: github.com/zclconf/go-cty
    version: v1.17.0
    sha256sum: 04999081dd92af910fd343acc2b500e60b338c935c9fb1df9956afe2281acfaf
  - module: github.com/zclconf/go-cty-debug
    version: v0.0.0-20240509010212-0d6042c53940
    sha256sum: 67852801b1e308972f24a0e4cb87125a01ad233ee9883f3ce6018e6b553ef80e
  - module: go.etcd.io/bbolt
    version: v1.5.0
    sha256sum: 2c350ca36afba707b917529a8049b001c71915c99c152d5e2600ed4bac6fbc37
  - module: go.opentelemetry.io/auto/sdk
    version: v1.2.1
    sha256sum: a08a16fc0a7041cdb875f47a260a56000632212c85f65a302a043c76380c8335
  - module: go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc
    version: v0.71.0
    sha256sum: 837540ee3def8b884606cdd9bf616fb9ff7ebb8bb76c0d6423d856ea4ad2c157
  - module: go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace
    version: v0.71.0
    sha256sum: 6b5f277c8d507c35aca712423bf739ee5c6eb624e905ee9ad99d42232113b6c6
  - module: go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp
    version: v0.71.0
    sha256sum: f518d56b4e820f12904a4501b6c80c79a4d3955f39886b7ef43295f2361dc8e9
  - module: go.opentelemetry.io/otel
    version: v1.46.0
    sha256sum: 5f1b7d702ee2e6e41880ef279a6c7ecae78f7867f5b3e92a3a87828d472501a9
  - module: go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc
    version: v1.46.0
    sha256sum: 8be944d1ff7467e6f3d1f68ed2ff54afabd487a68bc51b9462172981fc1e5c5a
  - module: go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp
    version: v1.46.0
    sha256sum: dbfd8f9064f5e7dbd19093ecc3cdf0da4c398bc1ac765594a66c3690ad54ecb1
  - module: go.opentelemetry.io/otel/exporters/otlp/otlptrace
    version: v1.46.0
    sha256sum: 9525fcb8bf01543e78e716ae10ff39c2a7181f73924de921402a04e4ba0be7b8
  - module: go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc
    version: v1.46.0
    sha256sum: dc5ff4f8efd9bb09577b3a9fbf1d13a50d72692618a4b6202d0274f568f0e441
  - module: go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp
    version: v1.46.0
    sha256sum: f87ca4401bb735a8f70c279e9fa07977d795f49c95d2d7518488614732d5ef55
  - module: go.opentelemetry.io/otel/exporters/prometheus
    version: v0.68.0
    sha256sum: b823df4cd5ad9329d98f2d97823e257aad9e34b3158010f2cc2c56729a9e6ed2
  - module: go.opentelemetry.io/otel/exporters/stdout/stdouttrace
    version: v1.46.0
    sha256sum: 5cda581e8fabf599c029f5813d8a2e934ac2bedc461f4645939b5c25c83c0d45
  - module: go.opentelemetry.io/otel/metric
    version: v1.46.0
    sha256sum: 9dfefa696b083e8d923b4bb531e8c6d38328a1a859c69236434c0b2d36cfc4c4
  - module: go.opentelemetry.io/otel/metric/x
    version: v0.68.0
    sha256sum: ca2dce76fa28fa98bc04a573149526c7f3cda203707cb927b010ff77e231ebdd
  - module: go.opentelemetry.io/otel/sdk
    version: v1.46.0
    sha256sum: 3b190b8bd3e596b4f8496a1842898207f21416345c3228ca133231199bbb3e05
  - module: go.opentelemetry.io/otel/sdk/metric
    version: v1.46.0
    sha256sum: df55dfb670650dc4e6ff2ac1e5e116e461bae85b4f11e3aff32c421fe492357c
  - module: go.opentelemetry.io/otel/trace
    version: v1.46.0
    sha256sum: 00c882750676e787b00f1c0328d99ed7ad0546e19af86c7af546c1343481c25a
  - module: go.opentelemetry.io/proto/otlp
    version: v1.11.0
    sha256sum: 790b98d472e7095511fa7feddd04e1d85bd844226e03ba482bd4105ef2217e09
  - module: go.step.sm/crypto
    version: v0.77.7
    sha256sum: 7d1fcac1035c84827bfd73f9b06f685bf26b665aa8b6e8ee9ca3c96f231b3651
  - module: go.uber.org/goleak
    version: v1.3.0
    sha256sum: 70edef0ce7d830d992f024e527fd3452069b884f94a27787a718bd68dd620702
  - module: go.uber.org/multierr
    version: v1.11.0
    sha256sum: 2249b5d2fdce61f6ee661a679d8552599af084a761cbbc871da77641bddce0c3
  - module: go.uber.org/zap
    version: v1.28.0
    sha256sum: 49d6287497537480c2e9330e3dee9c38ac793fbf9fd2257dbc4fa5697818919c
  - module: go.yaml.in/yaml/v2
    version: v2.4.4
    sha256sum: 1b98a6a498cf255c5f2982d32c74633bc7969770957e98103ac1e14345aa4576
  - module: go.yaml.in/yaml/v3
    version: v3.0.6
    sha256sum: 5ec6b154ced05b5fe8b15aef1287d647a70c9a53f43aa14e42d2bb5aee6cffac
  - module: go.yaml.in/yaml/v4
    version: v4.0.0-rc.4
    sha256sum: 9398112d7e82e7d19d01f0d5907ed232d8b1f44b0d487c9d5d0905a4d732996b
  - module: golang.org/x/crypto
    version: v0.57.0
    sha256sum: 856c916b92f1fc5b53983c04f6249f632f56c47ebc003bbcdfc503500dfb58b8
  - module: golang.org/x/mod
    version: v0.41.0
    sha256sum: 201e678d0a35b18b246abe58d80017b75d60be21cbaf4cbb9e963b48872565a9
  - module: golang.org/x/net
    version: v0.59.0
    sha256sum: 1dc3bf31fcebe80d393288ac8fe5cac7f0e82e9b3a2630021dcdf5ffbfa3f601
  - module: golang.org/x/oauth2
    version: v0.36.0
    sha256sum: 15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156002a13304504
  - module: golang.org/x/sync
    version: v0.23.0
    sha256sum: c19a11baba5c1a093cb4fd2f6d0d8d79673c97a82cb0fe2d693c9b6ad84f0f82
  - module: golang.org/x/sys
    version: v0.48.0
    sha256sum: 3a47e06431ba1e24d5b2aca3a7ce31fd13faff34df3e5d8e63f105ff9d0c1786
  - module: golang.org/x/term
    version: v0.46.0
    sha256sum: 9147fdd982f1aed1392183d5b48055f4f74c85d496604766c7f0b1d3bbd61c7c
  - module: golang.org/x/text
    version: v0.42.0
    sha256sum: a7b64e003056b6470303f408202098d8f3714a115f23091b8cac85edeb265476
  - module: golang.org/x/time
    version: v0.16.0
    sha256sum: ac27777be8088859ba3b1bea3648064dc95ff8bac3023b1b059d1ab126dc729e
  - module: golang.org/x/tools
    version: v0.49.0
    sha256sum: babd2d5a0ccf4eac49b6c9785be2b9e39b261097ad8b8a6b92578b9f248703d5
  - module: gonum.org/v1/gonum
    version: v0.17.0
    sha256sum: dadeb3d260548de27375f7188bdfd5a175110120fd8ee8085a63b0dff2cae501
  - module: google.golang.org/api
    version: v0.283.0
    sha256sum: d2dd30728e703d10523de66ece604493b7090a839e8eb98b15084c6b78b19ccc
  - module: google.golang.org/genproto
    version: v0.0.0-20260319201613-d00831a3d3e7
    sha256sum: a75d9f7ea0d1bba57acec769c848764c866c88f22fe8c0e9b295134d20e5400f
  - module: google.golang.org/genproto/googleapis/api
    version: v0.0.0-20260825221802-da73d73af1c5
    sha256sum: 3fd3154433fa2854341abb63f1bc4d834767e59e280dfa7a26fe2c951ea4a830
  - module: google.golang.org/genproto/googleapis/rpc
    version: v0.0.0-20260825221802-da73d73af1c5
    sha256sum: fa524d4bd3d27a627e34b376c4f163b3d050142c85f92b4e42bdee988d8275a5
  - module: google.golang.org/grpc
    version: v1.84.0
    sha256sum: a14bebefbac1ec115d9e1f8042006c185d65adf43a91644f3e58df0688831b95
  - module: google.golang.org/grpc/cmd/protoc-gen-go-grpc
    version: v1.6.2
    sha256sum: 6c79e1f21272c7b841b9640164482fd741cf4e5a4636039a4f0594d9743222c6
  - module: google.golang.org/protobuf
    version: v1.36.12
    sha256sum: 68f8a3174aff42950fd9bd02c11b45c6986eb8060508d124d1c3dd6bf86b9be6
  - module: gopkg.in/check.v1
    version: v1.0.0-20201130134442-10cb98267c6c
    sha256sum: f555684e5c5dacc2850dddb345fef1b8f93f546b72685589789da6d2b062710e
  - module: gopkg.in/evanphx/json-patch.v4
    version: v4.13.0
    sha256sum: de94747c5023a2c83909845c76acc6b4bfe28b44994207394b5e057f3085625a
  - module: gopkg.in/inf.v0
    version: v0.9.1
    sha256sum: 08abac18c95cc43b725d4925f63309398d618beab68b4669659b61255e5374a0
  - module: gopkg.in/yaml.v3
    version: v3.0.1
    sha256sum: aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015
  - module: gotest.tools/v3
    version: v3.5.2
    sha256sum: d7c40ae135e4a34dee9ca4847ad18208f138847721e693647b897259287a1d4b
  - module: k8s.io/api
    version: v0.37.0
    sha256sum: 7451225b8855d93b5b89a6797e2a9b875b2b429cc0720cd782e2d5481a7698e6
  - module: k8s.io/apimachinery
    version: v0.37.0
    sha256sum: 798a5e971e7f0da7882b1c9c325894486285b956f0b004ba0343d5753d23d76b
  - module: k8s.io/client-go
    version: v0.37.0
    sha256sum: e48557de0d71c7fe7365be5f325d033945df0bc55969a30be83a5f7e131835c4
  - module: k8s.io/klog/v2
    version: v2.140.0
    sha256sum: 46fab8686139b04c42f1b44e84c5a162667fbf22628216d5061d95206625a886
  - module: k8s.io/kube-openapi
    version: v0.0.0-20260721132016-d427ff9ee9ad
    sha256sum: d49441d035de2e04140f634bc3e4055d0ac59a05cd095cbb0717c3e36e16ed4c
  - module: k8s.io/streaming
    version: v0.37.0
    sha256sum: 365f3ba08a2392a5e59db3b75b6cd6071dafda8de1a30bb1e28d2dee8e4ddea7
  - module: k8s.io/utils
    version: v0.0.0-20260626114624-be93311217bd
    sha256sum: 11b292d2a6f02494c4d543c726426c307ad3901a7a781ab3fabeae40fd647840
  - module: pgregory.net/rapid
    version: v1.2.0
    sha256sum: c48fcf01d3621eb8fde71a0cfa46c3c1bb12cc5a038951bbef903b16916ae64a
  - module: sigs.k8s.io/json
    version: v0.0.0-20250730193827-2d320260d730
    sha256sum: 7cec6eae3e4e4c9c1e0a009eef200740990fafbcb9cab081eb18ce32f6e7a7b9
  - module: sigs.k8s.io/randfill
    version: v1.0.0
    sha256sum: 31dbbfc44ce12f78f1b68d6bbeed8526aa73c53243353d44d50b2532c828f5f1
  - module: sigs.k8s.io/structured-merge-diff/v6
    version: v6.4.2
    sha256sum: 9af2aa83a0a0ddb17f658ee8aad2a1b187450b8c0cac5687f7cc94d27d63112d
  - module: sigs.k8s.io/yaml
    version: v1.6.0
    sha256sum: cf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052
  - module: software.sslmate.com/src/go-pkcs12
    version: v0.4.0
    sha256sum: 55019a391e5302a51ba62e98909e006224b81207866da90beaf582ec0dee036f
