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
  ref: v0.36.1-0-g1d8dde89b8aba914e05e45366770736fea1fd690
- kind: go_module
  url: github:Masterminds/semver.git
  module: github.com/Masterminds/semver/v3
  ref:
    go-version: v3.4.0
    git-ref: v3.4.0-0-g61fc460d28283a91c53be65c2e0f20b494ac8ad9
    explicit: True
- kind: go_module
  url: github:Microsoft/go-winio.git
  module: github.com/Microsoft/go-winio
  ref:
    go-version: v0.6.3-0.20251027160822-ad3df93bed29
    git-ref: ad3df93bed29459e88baf3ece3e167e2f5d922dd
    explicit: True
- kind: go_module
  url: github:ProtonMail/go-crypto.git
  module: github.com/ProtonMail/go-crypto
  ref:
    go-version: v1.4.1
    git-ref: v1.4.1-0-g2e73b118bb72881b92b292f85cb2d057c3d7bef0
    explicit: True
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/config
  ref:
    go-version: v1.32.31
    git-ref: config/v1.32.31-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: config
- kind: go_module
  url: github:compose-spec/compose-go.git
  module: github.com/compose-spec/compose-go/v2
  ref:
    go-version: v2.13.0
    git-ref: v2.13.0-0-g0670a1c375c19defea19147bd82eb126a7c33b29
    explicit: True
- kind: go_module
  url: github:containerd/console.git
  module: github.com/containerd/console
  ref:
    go-version: v1.0.5
    git-ref: v1.0.5-0-gc8d962180f543ac07c008ecc79a413406ea10c0b
    explicit: True
- kind: go_module
  url: github:containerd/containerd.git
  module: github.com/containerd/containerd/v2
  ref:
    go-version: v2.3.3
    git-ref: v2.3.3-0-gaad11006b869517fcd3009450b6f82da282e1a9b
    explicit: True
- kind: go_module
  url: github:containerd/continuity.git
  module: github.com/containerd/continuity
  ref:
    go-version: v0.5.0
    git-ref: v0.5.0-0-ged9828dc553bfc7531268b0a1c9afe466b5abe0b
    explicit: True
- kind: go_module
  url: github:containerd/errdefs.git
  module: github.com/containerd/errdefs
  ref:
    go-version: v1.0.0
    git-ref: v1.0.0-0-g4817405e4a3caeb7aee9dac68ed55339c59cb635
    explicit: True
- kind: go_module
  url: github:containerd/log.git
  module: github.com/containerd/log
  ref:
    go-version: v0.1.0
    git-ref: v0.1.0-0-g0fc1e28871fdf2786e2cc51bbe4133db6547a199
    explicit: True
- kind: go_module
  url: github:creack/pty.git
  module: github.com/creack/pty
  ref:
    go-version: v1.1.24
    git-ref: v1.1.24-0-gedfbf75025b0ba4ee17c19f52d9b600fad80a787
    explicit: True
- kind: go_module
  url: github:davecgh/go-spew.git
  module: github.com/davecgh/go-spew
  ref:
    go-version: v1.1.2-0.20180830191138-d8f796af33cc
    git-ref: d8f796af33cc11cb798c1aaeb27a4ebc5099927d
    explicit: True
- kind: go_module
  url: github:distribution/reference.git
  module: github.com/distribution/reference
  ref:
    go-version: v0.6.0
    git-ref: v0.6.0-0-gff14fafe2236e51c2894ac07d4bdfc778e96d682
    explicit: True
- kind: go_module
  url: github:docker/cli.git
  module: github.com/docker/cli
  ref:
    go-version: v29.6.2+incompatible
    git-ref: v29.6.2-0-gdfc4efb1e2ab8c06d70d2a1366ad448d2f917e90
    explicit: True
- kind: go_module
  url: github:docker/cli-docs-tool.git
  module: github.com/docker/cli-docs-tool
  ref:
    go-version: v0.11.0
    git-ref: v0.11.0-0-gbf007734186023755e79bf718fbda8aefdeb45d0
    explicit: True
- kind: go_module
  url: github:docker/docker.git
  module: github.com/docker/docker
  ref:
    go-version: v28.5.2+incompatible
    git-ref: v28.5.2-0-g89c5e8fd66634b6128fc4c0e6f1236e2540e46e0
    explicit: True
- kind: go_module
  url: github:docker/go-units.git
  module: github.com/docker/go-units
  ref:
    go-version: v0.5.0
    git-ref: v0.5.0-0-ge682442797b36348f8e1f98defdbf32bac0b6c6f
    explicit: True
- kind: go_module
  url: github:gofrs/flock.git
  module: github.com/gofrs/flock
  ref:
    go-version: v0.13.0
    git-ref: v0.13.0-0-gbfec60bb026171031050af631b6dec974f14e9fa
    explicit: True
- kind: go_module
  url: github:golang/snappy.git
  module: github.com/golang/snappy
  ref:
    go-version: v1.0.0
    git-ref: v1.0.0-0-g43d5d4cd4e0e3390b0b645d5c3ef1187642403d8
    explicit: True
- kind: go_module
  url: github:google/go-dap.git
  module: github.com/google/go-dap
  ref:
    go-version: v0.12.1-0.20250904181021-d7a2259b058b
    git-ref: d7a2259b058b8bcd4e9d1803aa96a308bf03e394
    explicit: True
- kind: go_module
  url: github:google/shlex.git
  module: github.com/google/shlex
  ref:
    go-version: v0.0.0-20191202100458-e7afc7fbc510
    git-ref: e7afc7fbc51079733e9468cdfd1efcd7d196cd1d
    explicit: True
- kind: go_module
  url: github:google/uuid.git
  module: github.com/google/uuid
  ref:
    go-version: v1.6.0
    git-ref: v1.6.0-0-g0f11ee6918f41a04c201eceeadf612a377bc7fbc
    explicit: True
- kind: go_module
  url: github:hashicorp/go-cty-funcs.git
  module: github.com/hashicorp/go-cty-funcs
  ref:
    go-version: v0.0.0-20250818135842-6aab67130928
    git-ref: 6aab671309282ceb3432b07f94658c3f61d83a46
    explicit: True
- kind: go_module
  url: github:hashicorp/hcl.git
  module: github.com/hashicorp/hcl/v2
  ref:
    go-version: v2.24.0
    git-ref: v2.24.0-0-g6b5068090eef06b1f127f61529db5ba0be7ed343
    explicit: True
- kind: go_module
  url: github:in-toto/in-toto-golang.git
  module: github.com/in-toto/in-toto-golang
  ref:
    go-version: v0.11.0
    git-ref: v0.11.0-0-g36d782ffb2ca3adbffcdce1fd971c23319dd4469
    explicit: True
- kind: go_module
  url: github:mitchellh/hashstructure.git
  module: github.com/mitchellh/hashstructure/v2
  ref:
    go-version: v2.0.2
    git-ref: v2.0.2-0-ga045b665615f739329536a58c25ca6327abf1ec1
    explicit: True
- kind: go_module
  url: github:moby/buildkit.git
  module: github.com/moby/buildkit
  ref:
    go-version: v0.32.2
    git-ref: v0.32.2-0-g991535e0973488b6a429096d21fa13f81f2d89d8
    explicit: True
- kind: go_module
  url: github:moby/go-archive.git
  module: github.com/moby/go-archive
  ref:
    go-version: v0.2.1
    git-ref: v0.2.1-0-g0bfb09625293006825b7a57ffca9b9552eb9d872
    explicit: True
- kind: go_module
  url: github:moby/moby.git
  module: github.com/moby/moby/api
  ref:
    go-version: v1.55.0
    git-ref: api/v1.55.0-0-gb6c53c270450e3a0fd47c276ce1008f525e76884
    explicit: True
    subdirectory: api
- kind: go_module
  url: github:moby/moby.git
  module: github.com/moby/moby/client
  ref:
    go-version: v0.5.0
    git-ref: client/v0.5.0-0-g19e5ed711a316bfed51b24f98016dfaf839e08b7
    explicit: True
    subdirectory: client
- kind: go_module
  url: github:moby/policy-helpers.git
  module: github.com/moby/policy-helpers
  ref:
    go-version: v0.0.0-20260722051018-856be88baec4
    git-ref: 856be88baec46ecaa01f4d30676e48d14ccffa0b
    explicit: True
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/atomicwriter
  ref:
    go-version: v0.1.0
    git-ref: atomicwriter/v0.1.0-0-g4a75548218baa36bdbaaed1371a3e8a9cdfcffa0
    explicit: True
    subdirectory: atomicwriter
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/mountinfo
  ref:
    go-version: v0.7.2
    git-ref: mountinfo/v0.7.2-0-gcafbe42351600ca9b363e220722f66d96f6e71f4
    explicit: True
    subdirectory: mountinfo
- kind: go_module
  url: github:morikuni/aec.git
  module: github.com/morikuni/aec
  ref:
    go-version: v1.1.0
    git-ref: v1.1.0-0-gea8ec3476383e19653f7b3f5007f32e1eb4c9596
    explicit: True
- kind: go_module
  url: github:open-policy-agent/opa.git
  module: github.com/open-policy-agent/opa
  ref:
    go-version: v1.14.1
    git-ref: v1.14.1-0-g3d1bac44a21906cc7f118ae535b78e39185214a5
    explicit: True
- kind: go_module
  url: github:opencontainers/go-digest.git
  module: github.com/opencontainers/go-digest
  ref:
    go-version: v1.0.0
    git-ref: v1.0.0-0-gea51bea511f75cfa3ef6098cc253c5c3609b037a
    explicit: True
- kind: go_module
  url: github:opencontainers/image-spec.git
  module: github.com/opencontainers/image-spec
  ref:
    go-version: v1.1.1
    git-ref: v1.1.1-0-g147f9c13cedb47a0c4d9a11a222961073d585877
    explicit: True
- kind: go_module
  url: github:pelletier/go-toml.git
  module: github.com/pelletier/go-toml/v2
  ref:
    go-version: v2.3.1
    git-ref: v2.3.1-0-gf85c4e8142d63f3c193f84ecfbf4b99104a1c95f
    explicit: True
- kind: go_module
  url: github:pkg/browser.git
  module: github.com/pkg/browser
  ref:
    go-version: v0.0.0-20240102092130-5ac0b6a4141c
    git-ref: 5ac0b6a4141c771a0d3a081c36b87c977cf9c7db
    explicit: True
- kind: go_module
  url: github:pkg/errors.git
  module: github.com/pkg/errors
  ref:
    go-version: v0.9.1
    git-ref: v0.9.1-0-g614d223910a179a466c1767a985424175c39b465
    explicit: True
- kind: go_module
  url: github:planetscale/vtprotobuf.git
  module: github.com/planetscale/vtprotobuf
  ref:
    go-version: v0.6.1-0.20240319094008-0393e58bdf10
    git-ref: 0393e58bdf106fe0347e554d272a8f2c84d12461
    explicit: True
- kind: go_module
  url: github:serialx/hashring.git
  module: github.com/serialx/hashring
  ref:
    go-version: v0.0.0-20200727003509-22c0c7ab6b1b
    git-ref: 22c0c7ab6b1be4be7b950bae8b117767da7b18b6
    explicit: True
- kind: go_module
  url: github:sigstore/sigstore-go.git
  module: github.com/sigstore/sigstore-go
  ref:
    go-version: v1.2.2
    git-ref: v1.2.2-0-g55aa6240784677449a564e66a0fca7a6a3605ecd
    explicit: True
- kind: go_module
  url: github:sirupsen/logrus.git
  module: github.com/sirupsen/logrus
  ref:
    go-version: v1.9.4
    git-ref: v1.9.4-0-gb61f268f75b6ff134a62cd62aee1095fa12e8d2e
    explicit: True
- kind: go_module
  url: github:spf13/cobra.git
  module: github.com/spf13/cobra
  ref:
    go-version: v1.10.2
    git-ref: v1.10.2-0-g88b30ab89da2d0d0abb153818746c5a2d30eccec
    explicit: True
- kind: go_module
  url: github:spf13/pflag.git
  module: github.com/spf13/pflag
  ref:
    go-version: v1.0.10
    git-ref: v1.0.10-0-g0491e5702ad2bb108bc519a5221bcc0f52aa9564
    explicit: True
- kind: go_module
  url: github:stretchr/testify.git
  module: github.com/stretchr/testify
  ref:
    go-version: v1.11.1
    git-ref: v1.11.1-0-g2a57335dc9cd6833daa820bc94d9b40c26a7917d
    explicit: True
- kind: go_module
  url: github:tonistiigi/fsutil.git
  module: github.com/tonistiigi/fsutil
  ref:
    go-version: v0.0.0-20260717003753-6d9dc2ebad62
    git-ref: 6d9dc2ebad626eb645fb587f14225b3aa96ec010
    explicit: True
- kind: go_module
  url: github:tonistiigi/go-csvvalue.git
  module: github.com/tonistiigi/go-csvvalue
  ref:
    go-version: v0.0.0-20240814133006-030d3b2625d0
    git-ref: 030d3b2625d0ae73babf789e079c07ae2c9940b4
    explicit: True
- kind: go_module
  url: github:tonistiigi/jaeger-ui-rest.git
  module: github.com/tonistiigi/jaeger-ui-rest
  ref:
    go-version: v0.0.0-20250408171107-3dd17559e117
    git-ref: 3dd17559e117449543489dfacd6ae22014604045
    explicit: True
- kind: go_module
  url: github:zclconf/go-cty.git
  module: github.com/zclconf/go-cty
  ref:
    go-version: v1.17.0
    git-ref: v1.17.0-0-gda4c600729aefcf628d6b042ee439e6927d1104e
    explicit: True
- kind: go_module
  url: github:open-telemetry/opentelemetry-go-contrib.git
  module: go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp
  ref:
    go-version: v0.69.0
    git-ref: instrumentation/net/http/otelhttp/v0.69.0-0-g03b2bcdb54b3dde73c9ff91ae216aec262f6c8f5
    explicit: True
    subdirectory: instrumentation/net/http/otelhttp
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel
  ref:
    go-version: v1.44.0
    git-ref: v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/stdout/stdouttrace
  ref:
    go-version: v1.44.0
    git-ref: exporters/stdout/stdouttrace/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: exporters/stdout/stdouttrace
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/metric
  ref:
    go-version: v1.44.0
    git-ref: metric/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: metric
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/sdk
  ref:
    go-version: v1.44.0
    git-ref: sdk/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: sdk
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/trace
  ref:
    go-version: v1.44.0
    git-ref: trace/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: trace
- kind: go_module
  url: github:yaml/go-yaml.git
  module: go.yaml.in/yaml/v3
  ref:
    go-version: v3.0.4
    git-ref: v3.0.4-0-gc3552c15f996075a7634df5159d9161c67bf3d76
    explicit: True
- kind: go_module
  url: github:golang/crypto.git
  module: golang.org/x/crypto
  ref:
    go-version: v0.54.0
    git-ref: v0.54.0-0-gcdce021fa6c7d9c7eb2743bfbe551f0a98fd5d62
    explicit: True
- kind: go_module
  url: github:golang/mod.git
  module: golang.org/x/mod
  ref:
    go-version: v0.38.0
    git-ref: v0.38.0-0-g792ac169a90372d88fb14e712cb793061ba0c104
    explicit: True
- kind: go_module
  url: github:golang/sync.git
  module: golang.org/x/sync
  ref:
    go-version: v0.22.0
    git-ref: v0.22.0-0-g1eb64d4bc0cde6da1bb8ebc7f178bb577508e5d0
    explicit: True
- kind: go_module
  url: github:golang/sys.git
  module: golang.org/x/sys
  ref:
    go-version: v0.47.0
    git-ref: v0.47.0-0-g9e7e939dcafac07e8ab4cffa6e5fc74908413f00
    explicit: True
- kind: go_module
  url: github:golang/term.git
  module: golang.org/x/term
  ref:
    go-version: v0.45.0
    git-ref: v0.45.0-0-g9f69229da31ca6a34b522f59dbe07cad5ea21587
    explicit: True
- kind: go_module
  url: github:golang/text.git
  module: golang.org/x/text
  ref:
    go-version: v0.40.0
    git-ref: v0.40.0-0-g724af9c35838492dcaacc1ac51a8a0187c994c54
    explicit: True
- kind: go_module
  url: github:googleapis/go-genproto.git
  module: google.golang.org/genproto/googleapis/rpc
  ref:
    go-version: v0.0.0-20260526163538-3dc84a4a5aaa
    git-ref: 3dc84a4a5aaa87331e10f51e22e90d961f986894
    explicit: True
    subdirectory: googleapis/rpc
- kind: go_module
  url: github:grpc/grpc-go.git
  module: google.golang.org/grpc
  ref:
    go-version: v1.82.1
    git-ref: v1.82.1-0-gebd8f06a09426fbece97157c95c3917abff28f4e
    explicit: True
- kind: go_module
  url: github:grpc/grpc-go.git
  module: google.golang.org/grpc/cmd/protoc-gen-go-grpc
  ref:
    go-version: v1.6.1
    git-ref: cmd/protoc-gen-go-grpc/v1.6.1-0-g830c9098e4d034e0c7641e1fbc6001c2570bbc0f
    explicit: True
    subdirectory: cmd/protoc-gen-go-grpc
- kind: go_module
  url: https://go.googlesource.com/protobuf
  module: google.golang.org/protobuf
  ref:
    go-version: v1.36.12-0.20260120151049-f2248ac996af
    git-ref: f2248ac996afc39b3df0777cdcc269f6ade50b07
    explicit: True
- kind: go_module
  url: github:kubernetes/api.git
  module: k8s.io/api
  ref:
    go-version: v0.36.0
    git-ref: v0.36.0-0-g545bb975fe6653239af42324065cf72272186404
    explicit: True
- kind: go_module
  url: github:kubernetes/apimachinery.git
  module: k8s.io/apimachinery
  ref:
    go-version: v0.36.0
    git-ref: v0.36.0-0-gdebe1eba03a0c4134fd07a8f7586c44bb94ec7b0
    explicit: True
- kind: go_module
  url: github:kubernetes/client-go.git
  module: k8s.io/client-go
  ref:
    go-version: v0.36.0
    git-ref: v0.36.0-0-g1d95f02c1723330f751c9eb255aefb0dcd7ca3d6
    explicit: True
- kind: go_module
  url: github:Azure/go-ansiterm.git
  module: github.com/Azure/go-ansiterm
  ref:
    go-version: v0.0.0-20250102033503-faa5f7b0171c
    git-ref: faa5f7b0171c46bb398a91b4a0c906324d3664cf
    explicit: True
- kind: go_module
  url: github:agext/levenshtein.git
  module: github.com/agext/levenshtein
  ref:
    go-version: v1.2.3
    git-ref: v1.2.3-0-g52c14c47d03211d8ac1834e94601635e07c5a6ef
    explicit: True
- kind: go_module
  url: github:agnivade/levenshtein.git
  module: github.com/agnivade/levenshtein
  ref:
    go-version: v1.2.1
    git-ref: v1.2.1-0-g813c5d3147488182a4d0d6aea81fc9f28d330cc1
    explicit: True
- kind: go_module
  url: github:apparentlymart/go-cidr.git
  module: github.com/apparentlymart/go-cidr
  ref:
    go-version: v1.0.1
    git-ref: v1.0.1-0-gc0fb5fbe0acb592411e2db59add389a43260ad44
    explicit: True
- kind: go_module
  url: github:apparentlymart/go-textseg.git
  module: github.com/apparentlymart/go-textseg/v15
  ref:
    go-version: v15.0.0
    git-ref: v15.0.0-0-g72b78f42484ddc3f58858f794da1771fb9559ad0
    explicit: True
- kind: go_module
  url: github:asaskevich/govalidator.git
  module: github.com/asaskevich/govalidator
  ref:
    go-version: v0.0.0-20230301143203-a9d515a09cc2
    git-ref: a9d515a09cc289c60d55064edec5ef189859f172
    explicit: True
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2
  ref:
    go-version: v1.43.0
    git-ref: v1.43.0-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/credentials
  ref:
    go-version: v1.19.30
    git-ref: credentials/v1.19.30-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: credentials
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/feature/ec2/imds
  ref:
    go-version: v1.18.31
    git-ref: feature/ec2/imds/v1.18.31-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: feature/ec2/imds
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/internal/configsources
  ref:
    go-version: v1.4.31
    git-ref: internal/configsources/v1.4.31-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: internal/configsources
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/internal/endpoints/v2
  ref:
    go-version: v2.7.31
    git-ref: internal/endpoints/v2.7.31-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: internal/endpoints
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/internal/v4a
  ref:
    go-version: v1.4.32
    git-ref: internal/v4a/v1.4.32-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: internal/v4a
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding
  ref:
    go-version: v1.13.13
    git-ref: service/internal/accept-encoding/v1.13.13-0-gb4784c17b51e7f4dff48ac6016a09e21eeb683a8
    explicit: True
    subdirectory: service/internal/accept-encoding
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/internal/presigned-url
  ref:
    go-version: v1.13.31
    git-ref: service/internal/presigned-url/v1.13.31-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: service/internal/presigned-url
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/signin
  ref:
    go-version: v1.5.0
    git-ref: service/signin/v1.5.0-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: service/signin
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/sso
  ref:
    go-version: v1.33.0
    git-ref: service/sso/v1.33.0-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: service/sso
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/ssooidc
  ref:
    go-version: v1.38.0
    git-ref: service/ssooidc/v1.38.0-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: service/ssooidc
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/sts
  ref:
    go-version: v1.45.0
    git-ref: service/sts/v1.45.0-0-g4fef3455fe2dcb5ea3de4e9fbacf889b84c8a255
    explicit: True
    subdirectory: service/sts
- kind: go_module
  url: github:aws/smithy-go.git
  module: github.com/aws/smithy-go
  ref:
    go-version: v1.27.4
    git-ref: v1.27.4-0-g870555a648218564f98a855d655e6cc12031c4e3
    explicit: True
- kind: go_module
  url: github:blang/semver.git
  module: github.com/blang/semver
  ref:
    go-version: v3.5.1+incompatible
    git-ref: v3.5.1-0-g2ee87856327ba09384cabd113bc6b5d174e9ec0f
    explicit: True
- kind: go_module
  url: github:cenkalti/backoff.git
  module: github.com/cenkalti/backoff/v5
  ref:
    go-version: v5.0.3
    git-ref: v5.0.3-0-g7cad66a637c4ffff09d0795608116ddcc7eb1769
    explicit: True
- kind: go_module
  url: github:cespare/xxhash.git
  module: github.com/cespare/xxhash/v2
  ref:
    go-version: v2.3.0
    git-ref: v2.3.0-0-g998dce232f17418a7a5721ecf87ca714025a3243
    explicit: True
- kind: go_module
  url: github:clipperhouse/uax29.git
  module: github.com/clipperhouse/uax29/v2
  ref:
    go-version: v2.2.0
    git-ref: v2.2.0-0-g51ff7369f00be9d974b27846d43cb5b09fa20dac
    explicit: True
- kind: go_module
  url: github:cloudflare/circl.git
  module: github.com/cloudflare/circl
  ref:
    go-version: v1.6.3
    git-ref: v1.6.3-0-g24ae53c5d6f7fe18203adc125ba3ed76a38703e1
    explicit: True
- kind: go_module
  url: github:containerd/containerd.git
  module: github.com/containerd/containerd/api
  ref:
    go-version: v1.11.1
    git-ref: api/v1.11.1-0-gf822a911ab2b7c73e30bc0f36ea319642c9711b1
    explicit: True
    subdirectory: api
- kind: go_module
  url: github:containerd/errdefs.git
  module: github.com/containerd/errdefs/pkg
  ref:
    go-version: v0.3.0
    git-ref: pkg/v0.3.0-0-g4817405e4a3caeb7aee9dac68ed55339c59cb635
    explicit: True
    subdirectory: pkg
- kind: go_module
  url: github:containerd/ttrpc.git
  module: github.com/containerd/ttrpc
  ref:
    go-version: v1.2.9
    git-ref: v1.2.9-0-g4b166fb8651537835471d5243c5b174127e70e38
    explicit: True
- kind: go_module
  url: github:containerd/typeurl.git
  module: github.com/containerd/typeurl/v2
  ref:
    go-version: v2.3.0
    git-ref: v2.3.0-0-g125f7790c42c52610c44712bdc3a1748f785ae8d
    explicit: True
- kind: go_module
  url: github:cpuguy83/go-md2man.git
  module: github.com/cpuguy83/go-md2man/v2
  ref:
    go-version: v2.0.7
    git-ref: v2.0.7-0-g061b6c7cbecd6752049221aa15b7a05160796698
    explicit: True
- kind: go_module
  url: github:cyberphone/json-canonicalization.git
  module: github.com/cyberphone/json-canonicalization
  ref:
    go-version: v0.0.0-20241213102144-19d51d7fe467
    git-ref: 19d51d7fe467d4706a3ff08adf8a748f29fc21e0
    explicit: True
- kind: go_module
  url: github:decred/dcrd.git
  module: github.com/decred/dcrd/dcrec/secp256k1/v4
  ref:
    go-version: v4.4.0
    git-ref: dcrec/secp256k1/v4.4.0-0-gf98d08ef138a99711dbbc86c569935ded8d6a986
    explicit: True
    subdirectory: dcrec/secp256k1
- kind: go_module
  url: github:digitorus/pkcs7.git
  module: github.com/digitorus/pkcs7
  ref:
    go-version: v0.0.0-20230818184609-3a137a874352
    git-ref: 3a137a8743524b3683ca4e11608d0dde37caee99
    explicit: True
- kind: go_module
  url: github:digitorus/timestamp.git
  module: github.com/digitorus/timestamp
  ref:
    go-version: v0.0.0-20231217203849-220c5c2851b7
    git-ref: 220c5c2851b7435eea999de3daa773601a7ca126
    explicit: True
- kind: go_module
  url: github:docker/distribution.git
  module: github.com/docker/distribution
  ref:
    go-version: v2.8.3+incompatible
    git-ref: v2.8.3-0-g4772604ae973031ab32dd9805a4bccf61d94909f
    explicit: True
- kind: go_module
  url: github:docker/docker-credential-helpers.git
  module: github.com/docker/docker-credential-helpers
  ref:
    go-version: v0.9.8
    git-ref: v0.9.8-0-g4f6bc8ab27f64fbc65f810814448c756e958ab65
    explicit: True
- kind: go_module
  url: github:docker/go-connections.git
  module: github.com/docker/go-connections
  ref:
    go-version: v0.7.0
    git-ref: v0.7.0-0-g7997b0f0ac81b5b26ad7d3d2c02ca2e8fbc6c7d9
    explicit: True
- kind: go_module
  url: github:felixge/httpsnoop.git
  module: github.com/felixge/httpsnoop
  ref:
    go-version: v1.0.4
    git-ref: v1.0.4-0-gc5817c27ec125409c069052fdd171023c353501c
    explicit: True
- kind: go_module
  url: github:fvbommel/sortorder.git
  module: github.com/fvbommel/sortorder
  ref:
    go-version: v1.1.0
    git-ref: v1.1.0-0-ga8d9302c17f9f46c6580b82b919672e58ef6e396
    explicit: True
- kind: go_module
  url: github:fxamacker/cbor.git
  module: github.com/fxamacker/cbor/v2
  ref:
    go-version: v2.9.0
    git-ref: v2.9.0-0-gd29ad7351b55b1844387cf9306c4101658cc5256
    explicit: True
- kind: go_module
  url: github:go-logr/logr.git
  module: github.com/go-logr/logr
  ref:
    go-version: v1.4.3
    git-ref: v1.4.3-0-g38a1c47ef633fa6b2eee6b8f2e1371ba8626e557
    explicit: True
- kind: go_module
  url: github:go-logr/stdr.git
  module: github.com/go-logr/stdr
  ref:
    go-version: v1.2.2
    git-ref: v1.2.2-0-g521af2addfa7c81c8a65d0e85ed34bb6bb6dc262
    explicit: True
- kind: go_module
  url: github:go-openapi/analysis.git
  module: github.com/go-openapi/analysis
  ref:
    go-version: v0.25.2
    git-ref: v0.25.2-0-g9b965c02d20019a03262c6a8b3bac08b26ba6cae
    explicit: True
- kind: go_module
  url: github:go-openapi/errors.git
  module: github.com/go-openapi/errors
  ref:
    go-version: v0.22.8
    git-ref: v0.22.8-0-ga6770388153a83b5e93288d66979a29883828211
    explicit: True
- kind: go_module
  url: github:go-openapi/jsonpointer.git
  module: github.com/go-openapi/jsonpointer
  ref:
    go-version: v0.23.1
    git-ref: v0.23.1-0-gdf7695b297c4798b7f904c4ab4cf4bf386d0c72b
    explicit: True
- kind: go_module
  url: github:go-openapi/jsonreference.git
  module: github.com/go-openapi/jsonreference
  ref:
    go-version: v0.21.6
    git-ref: v0.21.6-0-gd7d125674f9be55dac8e0d863c44acf54402ce71
    explicit: True
- kind: go_module
  url: github:go-openapi/loads.git
  module: github.com/go-openapi/loads
  ref:
    go-version: v0.24.0
    git-ref: v0.24.0-0-g20651cc86ed12704a9701ccbd1028b3b56f0756f
    explicit: True
- kind: go_module
  url: github:go-openapi/runtime.git
  module: github.com/go-openapi/runtime
  ref:
    go-version: v0.32.4
    git-ref: v0.32.4-0-g908a0ff5afec66c0dedf8cdc8371c953924a3ec1
    explicit: True
- kind: go_module
  url: github:go-openapi/runtime.git
  module: github.com/go-openapi/runtime/server-middleware
  ref:
    go-version: v0.30.0
    git-ref: server-middleware/v0.30.0-0-g644458839dffd601a7e1790861a36da72f013346
    explicit: True
    subdirectory: server-middleware
- kind: go_module
  url: github:go-openapi/spec.git
  module: github.com/go-openapi/spec
  ref:
    go-version: v0.22.6
    git-ref: v0.22.6-0-g1b69857b2fdccf8ae956574c3e4bd925a7abfc90
    explicit: True
- kind: go_module
  url: github:go-openapi/strfmt.git
  module: github.com/go-openapi/strfmt
  ref:
    go-version: v0.26.4
    git-ref: v0.26.4-0-g09a3881eea5abd3a5b53284feafc018ddfde407e
    explicit: True
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag
  ref:
    go-version: v0.26.1
    git-ref: v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/cmdutils
  ref:
    go-version: v0.26.1
    git-ref: cmdutils/v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
    subdirectory: cmdutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/conv
  ref:
    go-version: v0.27.0
    git-ref: conv/v0.27.0-0-g4f9e7187ef25684f32276959ae5341fc0455be8d
    explicit: True
    subdirectory: conv
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/fileutils
  ref:
    go-version: v0.26.1
    git-ref: fileutils/v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
    subdirectory: fileutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/jsonname
  ref:
    go-version: v0.26.1
    git-ref: jsonname/v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
    subdirectory: jsonname
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/jsonutils
  ref:
    go-version: v0.26.1
    git-ref: jsonutils/v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
    subdirectory: jsonutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/loading
  ref:
    go-version: v0.26.1
    git-ref: loading/v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
    subdirectory: loading
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/mangling
  ref:
    go-version: v0.26.1
    git-ref: mangling/v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
    subdirectory: mangling
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/netutils
  ref:
    go-version: v0.26.1
    git-ref: netutils/v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
    subdirectory: netutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/stringutils
  ref:
    go-version: v0.26.1
    git-ref: stringutils/v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
    subdirectory: stringutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/typeutils
  ref:
    go-version: v0.27.0
    git-ref: typeutils/v0.27.0-0-g4f9e7187ef25684f32276959ae5341fc0455be8d
    explicit: True
    subdirectory: typeutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/yamlutils
  ref:
    go-version: v0.26.1
    git-ref: yamlutils/v0.26.1-0-g85923a56e403dee28f44c7b68a14d7bbfd9bcc05
    explicit: True
    subdirectory: yamlutils
- kind: go_module
  url: github:go-openapi/validate.git
  module: github.com/go-openapi/validate
  ref:
    go-version: v0.26.0
    git-ref: v0.26.0-0-g799b89794e919969225d7783a6740c49e871c7fb
    explicit: True
- kind: go_module
  url: github:go-viper/mapstructure.git
  module: github.com/go-viper/mapstructure/v2
  ref:
    go-version: v2.5.0
    git-ref: v2.5.0-0-g9aa3f77c68e2a56222ea436c1bfa631f1b1072d5
    explicit: True
- kind: go_module
  url: github:gobwas/glob.git
  module: github.com/gobwas/glob
  ref:
    go-version: v0.2.3
    git-ref: v0.2.3-0-g5ccd90ef52e1e632236f7326478d4faa74f99438
    explicit: True
- kind: go_module
  url: github:goccy/go-json.git
  module: github.com/goccy/go-json
  ref:
    go-version: v0.10.5
    git-ref: v0.10.5-0-g9872089c316cfe2d0f29b331b75d45bf6d522d96
    explicit: True
- kind: go_module
  url: github:google/certificate-transparency-go.git
  module: github.com/google/certificate-transparency-go
  ref:
    go-version: v1.3.3
    git-ref: v1.3.3-0-ge8f93173135c7817ebd7133dab729c4576ce9a21
    explicit: True
- kind: go_module
  url: github:google/go-cmp.git
  module: github.com/google/go-cmp
  ref:
    go-version: v0.7.0
    git-ref: v0.7.0-0-g9b12f366a942ebc7254abc7f32ca05068b455fb7
    explicit: True
- kind: go_module
  url: github:google/go-containerregistry.git
  module: github.com/google/go-containerregistry
  ref:
    go-version: v0.21.7
    git-ref: v0.21.7-0-gc68d899782693b63b7549166812aa996f17a660c
    explicit: True
- kind: go_module
  url: github:gorilla/mux.git
  module: github.com/gorilla/mux
  ref:
    go-version: v1.8.1
    git-ref: v1.8.1-0-gb4617d0b9670ad14039b2739167fd35a60f557c5
    explicit: True
- kind: go_module
  url: github:gorilla/websocket.git
  module: github.com/gorilla/websocket
  ref:
    go-version: v1.5.4-0.20250319132907-e064f32e3674
    git-ref: e064f32e3674d9d79a8fd417b5bc06fa5c6cad8f
    explicit: True
- kind: go_module
  url: github:grpc-ecosystem/grpc-gateway.git
  module: github.com/grpc-ecosystem/grpc-gateway/v2
  ref:
    go-version: v2.29.0
    git-ref: v2.29.0-0-gba9b55c1c15c84633be18c45463e123f31a5e999
    explicit: True
- kind: go_module
  url: github:hashicorp/go-cleanhttp.git
  module: github.com/hashicorp/go-cleanhttp
  ref:
    go-version: v0.5.2
    git-ref: v0.5.2-0-g6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2
    explicit: True
- kind: go_module
  url: github:hiddeco/sshsig.git
  module: github.com/hiddeco/sshsig
  ref:
    go-version: v0.2.0
    git-ref: v0.2.0-0-g49dc854ac39b55b9239cf5014b72a6ff2105bf2c
    explicit: True
- kind: go_module
  url: github:in-toto/attestation.git
  module: github.com/in-toto/attestation
  ref:
    go-version: v1.2.0
    git-ref: v1.2.0-0-gdf02077bf97218a8860a5c534eff1f1381f56984
    explicit: True
- kind: go_module
  url: github:inconshreveable/mousetrap.git
  module: github.com/inconshreveable/mousetrap
  ref:
    go-version: v1.1.0
    git-ref: v1.1.0-0-g4e8053ee7ef85a6bd26368364a6d27f1641c1d21
    explicit: True
- kind: go_module
  url: github:json-iterator/go.git
  module: github.com/json-iterator/go
  ref:
    go-version: v1.1.12
    git-ref: v1.1.12-0-g024077e996b048517130b21ea6bf12aa23055d3d
    explicit: True
- kind: go_module
  url: github:klauspost/compress.git
  module: github.com/klauspost/compress
  ref:
    go-version: v1.19.1
    git-ref: v1.19.1-0-g2602f4afea09fe72f2b58d4ed04d43a6047a0131
    explicit: True
- kind: go_module
  url: github:lestrrat-go/blackmagic.git
  module: github.com/lestrrat-go/blackmagic
  ref:
    go-version: v1.0.4
    git-ref: v1.0.4-0-g150de8a4e21172dd241760e4398a24a8dec3feaf
    explicit: True
- kind: go_module
  url: github:lestrrat-go/dsig.git
  module: github.com/lestrrat-go/dsig
  ref:
    go-version: v1.0.0
    git-ref: v1.0.0-0-ge7e4d54deeba321a433dfe959340ebe7a2db163d
    explicit: True
- kind: go_module
  url: github:lestrrat-go/dsig-secp256k1.git
  module: github.com/lestrrat-go/dsig-secp256k1
  ref:
    go-version: v1.0.0
    git-ref: v1.0.0-0-g761bd8630912128383a646ae5c0f9fa6051d8f1e
    explicit: True
- kind: go_module
  url: github:lestrrat-go/httpcc.git
  module: github.com/lestrrat-go/httpcc
  ref:
    go-version: v1.0.1
    git-ref: v1.0.1-0-g962f66809593fba7c5cdc78a0bdcf98827250e3c
    explicit: True
- kind: go_module
  url: github:lestrrat-go/httprc.git
  module: github.com/lestrrat-go/httprc/v3
  ref:
    go-version: v3.0.2
    git-ref: v3.0.2-0-gf935eb5f7909a543a82be9e9c584723d3d18f69f
    explicit: True
- kind: go_module
  url: github:lestrrat-go/jwx.git
  module: github.com/lestrrat-go/jwx/v3
  ref:
    go-version: v3.0.13
    git-ref: v3.0.13-0-g163a6e94d45a8f89c7d0e25f30652a95c554bd88
    explicit: True
- kind: go_module
  url: github:lestrrat-go/option.git
  module: github.com/lestrrat-go/option/v2
  ref:
    go-version: v2.0.0
    git-ref: v2.0.0-0-g0f819155513c6863e03a9b185a3ba996e5357f71
    explicit: True
- kind: go_module
  url: github:mattn/go-runewidth.git
  module: github.com/mattn/go-runewidth
  ref:
    go-version: v0.0.23
    git-ref: v0.0.23-0-g17a7a0366ba49830ca4d64024c8b94f5a8e36e5d
    explicit: True
- kind: go_module
  url: github:mattn/go-shellwords.git
  module: github.com/mattn/go-shellwords
  ref:
    go-version: v1.0.12
    git-ref: v1.0.12-0-g973b9d5391598d4ee601db46fa32f6e186a356ac
    explicit: True
- kind: go_module
  url: github:mitchellh/go-wordwrap.git
  module: github.com/mitchellh/go-wordwrap
  ref:
    go-version: v1.0.1
    git-ref: v1.0.1-0-gecf0936a077a4bd73a1cc2ac5c370f2b55618d62
    explicit: True
- kind: go_module
  url: github:moby/docker-image-spec.git
  module: github.com/moby/docker-image-spec
  ref:
    go-version: v1.3.1
    git-ref: v1.3.1-0-gf1d00ebd2d6d6805170d5543dbca4b850f35f9af
    explicit: True
- kind: go_module
  url: github:moby/locker.git
  module: github.com/moby/locker
  ref:
    go-version: v1.0.1
    git-ref: v1.0.1-0-g281af2d563954745bea9d1487c965f24d30742fe
    explicit: True
- kind: go_module
  url: github:moby/patternmatcher.git
  module: github.com/moby/patternmatcher
  ref:
    go-version: v0.6.1
    git-ref: v0.6.1-0-g5a6d8429a19bb6948a372ff19e86fe83599a04b7
    explicit: True
- kind: go_module
  url: github:moby/spdystream.git
  module: github.com/moby/spdystream
  ref:
    go-version: v0.5.1
    git-ref: v0.5.1-0-gc59e5d73daa301bde452ea77545bdf51e32554a2
    explicit: True
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/sequential
  ref:
    go-version: v0.7.0
    git-ref: sequential/v0.7.0-0-g8d586cf5490e12265732e106e0832c3b945cf5f7
    explicit: True
    subdirectory: sequential
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/signal
  ref:
    go-version: v0.7.1
    git-ref: signal/v0.7.1-0-gcafbe42351600ca9b363e220722f66d96f6e71f4
    explicit: True
    subdirectory: signal
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/user
  ref:
    go-version: v0.4.1
    git-ref: user/v0.4.1-0-g85a71bbe1faa36c552a960e6a5f3d0cfb632fbbe
    explicit: True
    subdirectory: user
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/userns
  ref:
    go-version: v0.1.0
    git-ref: userns/v0.1.0-0-g54475191138bd297c627eb1a59e1e54b953957f1
    explicit: True
    subdirectory: userns
- kind: go_module
  url: github:moby/term.git
  module: github.com/moby/term
  ref:
    go-version: v0.5.2
    git-ref: v0.5.2-0-g6c1b69fecbac2753dcaf18718a7e9f9093c3760d
    explicit: True
- kind: go_module
  url: github:modern-go/concurrent.git
  module: github.com/modern-go/concurrent
  ref:
    go-version: v0.0.0-20180306012644-bacd9c7ef1dd
    git-ref: bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94
    explicit: True
- kind: go_module
  url: github:modern-go/reflect2.git
  module: github.com/modern-go/reflect2
  ref:
    go-version: v1.0.3-0.20250322232337-35a7c28c31ee
    git-ref: 35a7c28c31ee079903db043180532306a621943a
    explicit: True
- kind: go_module
  url: github:munnerz/goautoneg.git
  module: github.com/munnerz/goautoneg
  ref:
    go-version: v0.0.0-20191010083416-a7dc8b61c822
    git-ref: a7dc8b61c822528f973a5e4e7b272055c6fdb43e
    explicit: True
- kind: go_module
  url: github:oklog/ulid.git
  module: github.com/oklog/ulid/v2
  ref:
    go-version: v2.1.1
    git-ref: v2.1.1-0-g96c4edf226ef639c92f96f42c7c2a161ae0e1a66
    explicit: True
- kind: go_module
  url: github:package-url/packageurl-go.git
  module: github.com/package-url/packageurl-go
  ref:
    go-version: v0.1.1
    git-ref: v0.1.1-0-g358f10025d4a923f7f9babc766f0968720e82240
    explicit: True
- kind: go_module
  url: github:pmezard/go-difflib.git
  module: github.com/pmezard/go-difflib
  ref:
    go-version: v1.0.1-0.20181226105442-5d4384ee4fb2
    git-ref: 5d4384ee4fb2527b0a1256a821ebfc92f91efefc
    explicit: True
- kind: go_module
  url: github:rcrowley/go-metrics.git
  module: github.com/rcrowley/go-metrics
  ref:
    go-version: v0.0.0-20250401214520-65e299d6c5c9
    git-ref: 65e299d6c5c92718e672a9d2bc7f96e5b687eef8
    explicit: True
- kind: go_module
  url: github:russross/blackfriday.git
  module: github.com/russross/blackfriday/v2
  ref:
    go-version: v2.1.0
    git-ref: v2.1.0-0-g4c9bf9512682b995722660a4196c0013228e2049
    explicit: True
- kind: go_module
  url: github:santhosh-tekuri/jsonschema.git
  module: github.com/santhosh-tekuri/jsonschema/v6
  ref:
    go-version: v6.0.1
    git-ref: v6.0.1-0-g87df339550a7b2440ff7da286bd34ece7d74039b
    explicit: True
- kind: go_module
  url: github:secure-systems-lab/go-securesystemslib.git
  module: github.com/secure-systems-lab/go-securesystemslib
  ref:
    go-version: v0.11.0
    git-ref: v0.11.0-0-g1ce0aca0c8640e2b119fb8de53fb193759085c6a
    explicit: True
- kind: go_module
  url: github:segmentio/asm.git
  module: github.com/segmentio/asm
  ref:
    go-version: v1.2.1
    git-ref: v1.2.1-0-g1cfacc81a878d4a07b13f51f2368cd86893d23fa
    explicit: True
- kind: go_module
  url: github:shibumi/go-pathspec.git
  module: github.com/shibumi/go-pathspec
  ref:
    go-version: v1.3.0
    git-ref: v1.3.0-0-g30eddf187f62305a5b34f662049d077211abaacd
    explicit: True
- kind: go_module
  url: github:sigstore/protobuf-specs.git
  module: github.com/sigstore/protobuf-specs
  ref:
    go-version: v0.5.1
    git-ref: v0.5.1-0-g3001afe9102b15b04ca1b91efccd613976bdf514
    explicit: True
- kind: go_module
  url: github:sigstore/rekor.git
  module: github.com/sigstore/rekor
  ref:
    go-version: v1.5.3
    git-ref: v1.5.3-0-g7d9dcffcc27c4912e7d17fc768db01aa2d5cf26c
    explicit: True
- kind: go_module
  url: github:sigstore/rekor-tiles.git
  module: github.com/sigstore/rekor-tiles/v2
  ref:
    go-version: v2.3.0
    git-ref: v2.3.0-0-gfa390b1c17f9685f7a164da2c06e82dc295cfdca
    explicit: True
- kind: go_module
  url: github:sigstore/sigstore.git
  module: github.com/sigstore/sigstore
  ref:
    go-version: v1.10.8
    git-ref: v1.10.8-0-gc761681120b37d9c4b1410cf5720571582ab090a
    explicit: True
- kind: go_module
  url: github:sigstore/timestamp-authority.git
  module: github.com/sigstore/timestamp-authority/v2
  ref:
    go-version: v2.1.2
    git-ref: v2.1.2-0-g21dff8b84c13344aa4a931d9779c514e4b7f8538
    explicit: True
- kind: go_module
  url: github:tchap/go-patricia.git
  module: github.com/tchap/go-patricia/v2
  ref:
    go-version: v2.3.3
    git-ref: v2.3.3-0-g8c5d7fa2ef98ad77bfbd2d2c3d67d4d17db0093a
    explicit: True
- kind: go_module
  url: github:theupdateframework/go-tuf.git
  module: github.com/theupdateframework/go-tuf/v2
  ref:
    go-version: v2.4.2
    git-ref: v2.4.2-0-gf5edbde31e5507f46db2069402dc38903fe6d9d4
    explicit: True
- kind: go_module
  url: github:tonistiigi/dchapes-mode.git
  module: github.com/tonistiigi/dchapes-mode
  ref:
    go-version: v0.0.0-20250318174251-73d941a28323
    git-ref: 73d941a28323f67dc09aefc69afd2770dc9dfc8b
    explicit: True
- kind: go_module
  url: github:tonistiigi/units.git
  module: github.com/tonistiigi/units
  ref:
    go-version: v0.0.0-20180711220420-6950e57a87ea
    git-ref: 6950e57a87eaf136bbe44ef2ec8e75b9e3569de2
    explicit: True
- kind: go_module
  url: github:tonistiigi/vt100.git
  module: github.com/tonistiigi/vt100
  ref:
    go-version: v0.0.0-20240514184818-90bafcd6abab
    git-ref: 90bafcd6abab5dc87970f00165ee2022806709fd
    explicit: True
- kind: go_module
  url: github:transparency-dev/formats.git
  module: github.com/transparency-dev/formats
  ref:
    go-version: v0.1.1
    git-ref: v0.1.1-0-gf8d9dedb054599382b7b6867b9cb87837424879c
    explicit: True
- kind: go_module
  url: github:transparency-dev/merkle.git
  module: github.com/transparency-dev/merkle
  ref:
    go-version: v0.0.2
    git-ref: v0.0.2-0-g036047b5d2f7faf3b1ee643d391e60fe5b1defcf
    explicit: True
- kind: go_module
  url: github:valyala/fastjson.git
  module: github.com/valyala/fastjson
  ref:
    go-version: v1.6.7
    git-ref: v1.6.7-0-gb2db15556365622f27f99c4a58f457adc7a20961
    explicit: True
- kind: go_module
  url: github:vektah/gqlparser.git
  module: github.com/vektah/gqlparser/v2
  ref:
    go-version: v2.5.32
    git-ref: v2.5.32-0-gd828d64cc21d41fcfaf1b7ecc3c65581ed2b9810
    explicit: True
- kind: go_module
  url: github:x448/float16.git
  module: github.com/x448/float16
  ref:
    go-version: v0.8.4
    git-ref: v0.8.4-0-gcb9afec31f2649663ebb64da5c6c32c3d365c3ca
    explicit: True
- kind: go_module
  url: github:xeipuuv/gojsonpointer.git
  module: github.com/xeipuuv/gojsonpointer
  ref:
    go-version: v0.0.0-20190905194746-02993c407bfb
    git-ref: 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb
    explicit: True
- kind: go_module
  url: github:xeipuuv/gojsonreference.git
  module: github.com/xeipuuv/gojsonreference
  ref:
    go-version: v0.0.0-20180127040603-bd5ef7bd5415
    git-ref: bd5ef7bd5415a7ac448318e64f11a24cd21e594b
    explicit: True
- kind: go_module
  url: github:xhit/go-str2duration.git
  module: github.com/xhit/go-str2duration/v2
  ref:
    go-version: v2.1.0
    git-ref: v2.1.0-0-g017325bfda0895fe02177e4ebb07962e58735bbf
    explicit: True
- kind: go_module
  url: github:yashtewari/glob-intersection.git
  module: github.com/yashtewari/glob-intersection
  ref:
    go-version: v0.2.0
    git-ref: v0.2.0-0-g9f24ebf25f62b3565b778d6ec98775caf0e37720
    explicit: True
- kind: go_module
  url: github:youmark/pkcs8.git
  module: github.com/youmark/pkcs8
  ref:
    go-version: v0.0.0-20240726163527-a2c0da244d78
    git-ref: a2c0da244d782506f23dd28c916a6efc2b33f9d6
    explicit: True
- kind: go_module
  url: github:open-telemetry/opentelemetry-go-instrumentation.git
  module: go.opentelemetry.io/auto/sdk
  ref:
    go-version: v1.2.1
    git-ref: sdk/v1.2.1-0-g715f58ce2f17e2176b8e53b871e47531a259cc1d
    explicit: True
    subdirectory: sdk
- kind: go_module
  url: github:open-telemetry/opentelemetry-go-contrib.git
  module: go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc
  ref:
    go-version: v0.69.0
    git-ref: instrumentation/google.golang.org/grpc/otelgrpc/v0.69.0-0-g03b2bcdb54b3dde73c9ff91ae216aec262f6c8f5
    explicit: True
    subdirectory: instrumentation/google.golang.org/grpc/otelgrpc
- kind: go_module
  url: github:open-telemetry/opentelemetry-go-contrib.git
  module: go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace
  ref:
    go-version: v0.69.0
    git-ref: instrumentation/net/http/httptrace/otelhttptrace/v0.69.0-0-g03b2bcdb54b3dde73c9ff91ae216aec262f6c8f5
    explicit: True
    subdirectory: instrumentation/net/http/httptrace/otelhttptrace
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc
  ref:
    go-version: v1.44.0
    git-ref: exporters/otlp/otlpmetric/otlpmetricgrpc/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: exporters/otlp/otlpmetric/otlpmetricgrpc
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp
  ref:
    go-version: v1.44.0
    git-ref: exporters/otlp/otlpmetric/otlpmetrichttp/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: exporters/otlp/otlpmetric/otlpmetrichttp
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlptrace
  ref:
    go-version: v1.44.0
    git-ref: exporters/otlp/otlptrace/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: exporters/otlp/otlptrace
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc
  ref:
    go-version: v1.44.0
    git-ref: exporters/otlp/otlptrace/otlptracegrpc/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: exporters/otlp/otlptrace/otlptracegrpc
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp
  ref:
    go-version: v1.44.0
    git-ref: exporters/otlp/otlptrace/otlptracehttp/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: exporters/otlp/otlptrace/otlptracehttp
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/sdk/metric
  ref:
    go-version: v1.44.0
    git-ref: sdk/metric/v1.44.0-0-gb62d92831b2dd142f5a0cc89c828270274196877
    explicit: True
    subdirectory: sdk/metric
- kind: go_module
  url: github:open-telemetry/opentelemetry-proto-go.git
  module: go.opentelemetry.io/proto/otlp
  ref:
    go-version: v1.10.0
    git-ref: otlp/v1.10.0-0-g5abb227a3efbfea092a8db5b89a8a9e59117cee1
    explicit: True
    subdirectory: otlp
- kind: go_module
  url: github:yaml/go-yaml.git
  module: go.yaml.in/yaml/v2
  ref:
    go-version: v2.4.4
    git-ref: v2.4.4-0-g43b627a9da72517e91dbcf07cd10dfd6618423d8
    explicit: True
- kind: go_module
  url: github:yaml/go-yaml.git
  module: go.yaml.in/yaml/v4
  ref:
    go-version: v4.0.0-rc.4
    git-ref: v4.0.0-rc.4-0-g068e4d63881bdd1923f069559870b6d153b15478
    explicit: True
- kind: go_module
  url: github:golang/net.git
  module: golang.org/x/net
  ref:
    go-version: v0.57.0
    git-ref: v0.57.0-0-gb8f09f6f062ceb4531b7af4bd17a5c8fe9c4b2b5
    explicit: True
- kind: go_module
  url: github:golang/oauth2.git
  module: golang.org/x/oauth2
  ref:
    go-version: v0.36.0
    git-ref: v0.36.0-0-g4d954e69a88d9e1ccb8439f8d5b6cbef230c4ef9
    explicit: True
- kind: go_module
  url: github:golang/time.git
  module: golang.org/x/time
  ref:
    go-version: v0.15.0
    git-ref: v0.15.0-0-g812b343c8714c317b0dad633efa6d103e554c006
    explicit: True
- kind: go_module
  url: github:golang/tools.git
  module: golang.org/x/tools
  ref:
    go-version: v0.47.0
    git-ref: v0.47.0-0-gfbf9f2e2c8124fbe1877f5ed2857111038d9fe12
    explicit: True
- kind: go_module
  url: github:googleapis/go-genproto.git
  module: google.golang.org/genproto/googleapis/api
  ref:
    go-version: v0.0.0-20260526163538-3dc84a4a5aaa
    git-ref: 3dc84a4a5aaa87331e10f51e22e90d961f986894
    explicit: True
    subdirectory: googleapis/api
- kind: go_module
  url: https://gopkg.in/inf.v0
  module: gopkg.in/inf.v0
  ref:
    go-version: v0.9.1
    git-ref: v0.9.1-0-gd2d2541c53f18d2a059457998ce2876cc8e67cbf
    explicit: True
- kind: go_module
  url: https://gopkg.in/yaml.v3
  module: gopkg.in/yaml.v3
  ref:
    go-version: v3.0.1
    git-ref: v3.0.1-0-gf6f7691b1fdeb513f56608cd2c32c51f8194bf51
    explicit: True
- kind: go_module
  url: github:kubernetes/klog.git
  module: k8s.io/klog/v2
  ref:
    go-version: v2.140.0
    git-ref: v2.140.0-0-gef4b370a5578b77a401416e4d12f5900cc8850cb
    explicit: True
- kind: go_module
  url: github:kubernetes/kube-openapi.git
  module: k8s.io/kube-openapi
  ref:
    go-version: v0.0.0-20260319004828-5883c5ee87b9
    git-ref: 5883c5ee87b9354a0709c759cf1952f089453c91
    explicit: True
- kind: go_module
  url: github:kubernetes/streaming.git
  module: k8s.io/streaming
  ref:
    go-version: v0.36.0
    git-ref: v0.36.0-0-gfbcf184e52bfd8a40d46311b494493c287fd6d05
    explicit: True
- kind: go_module
  url: github:kubernetes/utils.git
  module: k8s.io/utils
  ref:
    go-version: v0.0.0-20260319190234-28399d86e0b5
    git-ref: 28399d86e0b55e612b83ad94dc6bac8e5de2a5ac
    explicit: True
- kind: go_module
  url: github:kubernetes-sigs/json.git
  module: sigs.k8s.io/json
  ref:
    go-version: v0.0.0-20250730193827-2d320260d730
    git-ref: 2d320260d730f3842fef7b08d9a807bdbc617824
    explicit: True
- kind: go_module
  url: github:kubernetes-sigs/randfill.git
  module: sigs.k8s.io/randfill
  ref:
    go-version: v1.0.0
    git-ref: v1.0.0-0-g1b6128de8ceabf6d20c4d81d770bf439c1494960
    explicit: True
- kind: go_module
  url: github:kubernetes-sigs/structured-merge-diff.git
  module: sigs.k8s.io/structured-merge-diff/v6
  ref:
    go-version: v6.3.2
    git-ref: v6.3.2-0-gd9cc6641c48292946e838bfc3b9bf7c297526757
    explicit: True
- kind: go_module
  url: github:kubernetes-sigs/yaml.git
  module: sigs.k8s.io/yaml
  ref:
    go-version: v1.6.0
    git-ref: v1.6.0-0-g048d724aca2d37ddb5b03c90b5b4550a3a48766d
    explicit: True
