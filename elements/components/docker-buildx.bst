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
  ref: v0.36.0-rc1-0-g4e15a5aca0e63b9c504b8a1c4e67993bc3e289b3
- kind: go_module
  url: github:Masterminds/semver.git
  module: github.com/Masterminds/semver/v3
- kind: go_module
  url: github:Microsoft/go-winio.git
  module: github.com/Microsoft/go-winio
- kind: go_module
  url: github:ProtonMail/go-crypto.git
  module: github.com/ProtonMail/go-crypto
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/config
- kind: go_module
  url: github:compose-spec/compose-go.git
  module: github.com/compose-spec/compose-go/v2
- kind: go_module
  url: github:containerd/console.git
  module: github.com/containerd/console
- kind: go_module
  url: github:containerd/containerd.git
  module: github.com/containerd/containerd/v2
- kind: go_module
  url: github:containerd/continuity.git
  module: github.com/containerd/continuity
- kind: go_module
  url: github:containerd/errdefs.git
  module: github.com/containerd/errdefs
- kind: go_module
  url: github:containerd/log.git
  module: github.com/containerd/log
- kind: go_module
  url: github:creack/pty.git
  module: github.com/creack/pty
- kind: go_module
  url: github:davecgh/go-spew.git
  module: github.com/davecgh/go-spew
- kind: go_module
  url: github:distribution/reference.git
  module: github.com/distribution/reference
- kind: go_module
  url: github:docker/cli.git
  module: github.com/docker/cli
- kind: go_module
  url: github:docker/cli-docs-tool.git
  module: github.com/docker/cli-docs-tool
- kind: go_module
  url: github:docker/docker.git
  module: github.com/docker/docker
- kind: go_module
  url: github:docker/go-units.git
  module: github.com/docker/go-units
- kind: go_module
  url: github:gofrs/flock.git
  module: github.com/gofrs/flock
- kind: go_module
  url: github:golang/snappy.git
  module: github.com/golang/snappy
- kind: go_module
  url: github:google/go-dap.git
  module: github.com/google/go-dap
- kind: go_module
  url: github:google/shlex.git
  module: github.com/google/shlex
- kind: go_module
  url: github:google/uuid.git
  module: github.com/google/uuid
- kind: go_module
  url: github:hashicorp/go-cty-funcs.git
  module: github.com/hashicorp/go-cty-funcs
- kind: go_module
  url: github:hashicorp/hcl.git
  module: github.com/hashicorp/hcl/v2
- kind: go_module
  url: github:in-toto/in-toto-golang.git
  module: github.com/in-toto/in-toto-golang
- kind: go_module
  url: github:mitchellh/hashstructure.git
  module: github.com/mitchellh/hashstructure/v2
- kind: go_module
  url: github:moby/buildkit.git
  module: github.com/moby/buildkit
- kind: go_module
  url: github:moby/go-archive.git
  module: github.com/moby/go-archive
- kind: go_module
  url: github:moby/moby.git
  module: github.com/moby/moby/api
- kind: go_module
  url: github:moby/moby.git
  module: github.com/moby/moby/client
- kind: go_module
  url: github:moby/policy-helpers.git
  module: github.com/moby/policy-helpers
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/atomicwriter
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/mountinfo
- kind: go_module
  url: github:morikuni/aec.git
  module: github.com/morikuni/aec
- kind: go_module
  url: github:open-policy-agent/opa.git
  module: github.com/open-policy-agent/opa
- kind: go_module
  url: github:opencontainers/go-digest.git
  module: github.com/opencontainers/go-digest
- kind: go_module
  url: github:opencontainers/image-spec.git
  module: github.com/opencontainers/image-spec
- kind: go_module
  url: github:pelletier/go-toml.git
  module: github.com/pelletier/go-toml/v2
- kind: go_module
  url: github:pkg/browser.git
  module: github.com/pkg/browser
- kind: go_module
  url: github:pkg/errors.git
  module: github.com/pkg/errors
- kind: go_module
  url: github:planetscale/vtprotobuf.git
  module: github.com/planetscale/vtprotobuf
- kind: go_module
  url: github:serialx/hashring.git
  module: github.com/serialx/hashring
- kind: go_module
  url: github:sigstore/sigstore-go.git
  module: github.com/sigstore/sigstore-go
- kind: go_module
  url: github:sirupsen/logrus.git
  module: github.com/sirupsen/logrus
- kind: go_module
  url: github:spf13/cobra.git
  module: github.com/spf13/cobra
- kind: go_module
  url: github:spf13/pflag.git
  module: github.com/spf13/pflag
- kind: go_module
  url: github:stretchr/testify.git
  module: github.com/stretchr/testify
- kind: go_module
  url: github:tonistiigi/fsutil.git
  module: github.com/tonistiigi/fsutil
- kind: go_module
  url: github:tonistiigi/go-csvvalue.git
  module: github.com/tonistiigi/go-csvvalue
- kind: go_module
  url: github:tonistiigi/jaeger-ui-rest.git
  module: github.com/tonistiigi/jaeger-ui-rest
- kind: go_module
  url: github:zclconf/go-cty.git
  module: github.com/zclconf/go-cty
- kind: go_module
  url: github:open-telemetry/opentelemetry-go-contrib.git
  module: go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/stdout/stdouttrace
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/metric
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/sdk
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/trace
- kind: go_module
  url: github:yaml/go-yaml.git
  module: go.yaml.in/yaml/v3
- kind: go_module
  url: github:golang/crypto.git
  module: golang.org/x/crypto
- kind: go_module
  url: github:golang/mod.git
  module: golang.org/x/mod
- kind: go_module
  url: github:golang/sync.git
  module: golang.org/x/sync
- kind: go_module
  url: github:golang/sys.git
  module: golang.org/x/sys
- kind: go_module
  url: github:golang/term.git
  module: golang.org/x/term
- kind: go_module
  url: github:golang/text.git
  module: golang.org/x/text
- kind: go_module
  url: github:googleapis/go-genproto.git
  module: google.golang.org/genproto/googleapis/rpc
- kind: go_module
  url: github:grpc/grpc-go.git
  module: google.golang.org/grpc
- kind: go_module
  url: github:grpc/grpc-go.git
  module: google.golang.org/grpc/cmd/protoc-gen-go-grpc
- kind: go_module
  url: https://go.googlesource.com/protobuf
  module: google.golang.org/protobuf
- kind: go_module
  url: github:kubernetes/api.git
  module: k8s.io/api
- kind: go_module
  url: github:kubernetes/apimachinery.git
  module: k8s.io/apimachinery
- kind: go_module
  url: github:kubernetes/client-go.git
  module: k8s.io/client-go
- kind: go_module
  url: github:Azure/go-ansiterm.git
  module: github.com/Azure/go-ansiterm
- kind: go_module
  url: github:agext/levenshtein.git
  module: github.com/agext/levenshtein
- kind: go_module
  url: github:agnivade/levenshtein.git
  module: github.com/agnivade/levenshtein
- kind: go_module
  url: github:apparentlymart/go-cidr.git
  module: github.com/apparentlymart/go-cidr
- kind: go_module
  url: github:apparentlymart/go-textseg.git
  module: github.com/apparentlymart/go-textseg/v15
- kind: go_module
  url: github:asaskevich/govalidator.git
  module: github.com/asaskevich/govalidator
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/credentials
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/feature/ec2/imds
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/internal/configsources
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/internal/endpoints/v2
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/internal/v4a
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/internal/presigned-url
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/signin
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/sso
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/ssooidc
- kind: go_module
  url: github:aws/aws-sdk-go-v2.git
  module: github.com/aws/aws-sdk-go-v2/service/sts
- kind: go_module
  url: github:aws/smithy-go.git
  module: github.com/aws/smithy-go
- kind: go_module
  url: github:blang/semver.git
  module: github.com/blang/semver
- kind: go_module
  url: github:cenkalti/backoff.git
  module: github.com/cenkalti/backoff/v5
- kind: go_module
  url: github:cespare/xxhash.git
  module: github.com/cespare/xxhash/v2
- kind: go_module
  url: github:clipperhouse/uax29.git
  module: github.com/clipperhouse/uax29/v2
- kind: go_module
  url: github:cloudflare/circl.git
  module: github.com/cloudflare/circl
- kind: go_module
  url: github:containerd/containerd.git
  module: github.com/containerd/containerd/api
- kind: go_module
  url: github:containerd/errdefs.git
  module: github.com/containerd/errdefs/pkg
- kind: go_module
  url: github:containerd/ttrpc.git
  module: github.com/containerd/ttrpc
- kind: go_module
  url: github:containerd/typeurl.git
  module: github.com/containerd/typeurl/v2
- kind: go_module
  url: github:cpuguy83/go-md2man.git
  module: github.com/cpuguy83/go-md2man/v2
- kind: go_module
  url: github:cyberphone/json-canonicalization.git
  module: github.com/cyberphone/json-canonicalization
- kind: go_module
  url: github:decred/dcrd.git
  module: github.com/decred/dcrd/dcrec/secp256k1/v4
- kind: go_module
  url: github:digitorus/pkcs7.git
  module: github.com/digitorus/pkcs7
- kind: go_module
  url: github:digitorus/timestamp.git
  module: github.com/digitorus/timestamp
- kind: go_module
  url: github:docker/distribution.git
  module: github.com/docker/distribution
- kind: go_module
  url: github:docker/docker-credential-helpers.git
  module: github.com/docker/docker-credential-helpers
- kind: go_module
  url: github:docker/go-connections.git
  module: github.com/docker/go-connections
- kind: go_module
  url: github:felixge/httpsnoop.git
  module: github.com/felixge/httpsnoop
- kind: go_module
  url: github:fvbommel/sortorder.git
  module: github.com/fvbommel/sortorder
- kind: go_module
  url: github:fxamacker/cbor.git
  module: github.com/fxamacker/cbor/v2
- kind: go_module
  url: github:go-logr/logr.git
  module: github.com/go-logr/logr
- kind: go_module
  url: github:go-logr/stdr.git
  module: github.com/go-logr/stdr
- kind: go_module
  url: github:go-openapi/analysis.git
  module: github.com/go-openapi/analysis
- kind: go_module
  url: github:go-openapi/errors.git
  module: github.com/go-openapi/errors
- kind: go_module
  url: github:go-openapi/jsonpointer.git
  module: github.com/go-openapi/jsonpointer
- kind: go_module
  url: github:go-openapi/jsonreference.git
  module: github.com/go-openapi/jsonreference
- kind: go_module
  url: github:go-openapi/loads.git
  module: github.com/go-openapi/loads
- kind: go_module
  url: github:go-openapi/runtime.git
  module: github.com/go-openapi/runtime
- kind: go_module
  url: github:go-openapi/runtime.git
  module: github.com/go-openapi/runtime/server-middleware
- kind: go_module
  url: github:go-openapi/spec.git
  module: github.com/go-openapi/spec
- kind: go_module
  url: github:go-openapi/strfmt.git
  module: github.com/go-openapi/strfmt
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/cmdutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/conv
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/fileutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/jsonname
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/jsonutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/loading
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/mangling
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/netutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/stringutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/typeutils
- kind: go_module
  url: github:go-openapi/swag.git
  module: github.com/go-openapi/swag/yamlutils
- kind: go_module
  url: github:go-openapi/validate.git
  module: github.com/go-openapi/validate
- kind: go_module
  url: github:go-viper/mapstructure.git
  module: github.com/go-viper/mapstructure/v2
- kind: go_module
  url: github:gobwas/glob.git
  module: github.com/gobwas/glob
- kind: go_module
  url: github:goccy/go-json.git
  module: github.com/goccy/go-json
- kind: go_module
  url: github:google/certificate-transparency-go.git
  module: github.com/google/certificate-transparency-go
- kind: go_module
  url: github:google/go-cmp.git
  module: github.com/google/go-cmp
- kind: go_module
  url: github:google/go-containerregistry.git
  module: github.com/google/go-containerregistry
- kind: go_module
  url: github:gorilla/mux.git
  module: github.com/gorilla/mux
- kind: go_module
  url: github:gorilla/websocket.git
  module: github.com/gorilla/websocket
- kind: go_module
  url: github:grpc-ecosystem/grpc-gateway.git
  module: github.com/grpc-ecosystem/grpc-gateway/v2
- kind: go_module
  url: github:hashicorp/go-cleanhttp.git
  module: github.com/hashicorp/go-cleanhttp
- kind: go_module
  url: github:hiddeco/sshsig.git
  module: github.com/hiddeco/sshsig
- kind: go_module
  url: github:in-toto/attestation.git
  module: github.com/in-toto/attestation
- kind: go_module
  url: github:inconshreveable/mousetrap.git
  module: github.com/inconshreveable/mousetrap
- kind: go_module
  url: github:json-iterator/go.git
  module: github.com/json-iterator/go
- kind: go_module
  url: github:klauspost/compress.git
  module: github.com/klauspost/compress
- kind: go_module
  url: github:lestrrat-go/blackmagic.git
  module: github.com/lestrrat-go/blackmagic
- kind: go_module
  url: github:lestrrat-go/dsig.git
  module: github.com/lestrrat-go/dsig
- kind: go_module
  url: github:lestrrat-go/dsig-secp256k1.git
  module: github.com/lestrrat-go/dsig-secp256k1
- kind: go_module
  url: github:lestrrat-go/httpcc.git
  module: github.com/lestrrat-go/httpcc
- kind: go_module
  url: github:lestrrat-go/httprc.git
  module: github.com/lestrrat-go/httprc/v3
- kind: go_module
  url: github:lestrrat-go/jwx.git
  module: github.com/lestrrat-go/jwx/v3
- kind: go_module
  url: github:lestrrat-go/option.git
  module: github.com/lestrrat-go/option/v2
- kind: go_module
  url: github:mattn/go-runewidth.git
  module: github.com/mattn/go-runewidth
- kind: go_module
  url: github:mattn/go-shellwords.git
  module: github.com/mattn/go-shellwords
- kind: go_module
  url: github:mitchellh/go-wordwrap.git
  module: github.com/mitchellh/go-wordwrap
- kind: go_module
  url: github:moby/docker-image-spec.git
  module: github.com/moby/docker-image-spec
- kind: go_module
  url: github:moby/locker.git
  module: github.com/moby/locker
- kind: go_module
  url: github:moby/patternmatcher.git
  module: github.com/moby/patternmatcher
- kind: go_module
  url: github:moby/spdystream.git
  module: github.com/moby/spdystream
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/sequential
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/signal
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/user
- kind: go_module
  url: github:moby/sys.git
  module: github.com/moby/sys/userns
- kind: go_module
  url: github:moby/term.git
  module: github.com/moby/term
- kind: go_module
  url: github:modern-go/concurrent.git
  module: github.com/modern-go/concurrent
- kind: go_module
  url: github:modern-go/reflect2.git
  module: github.com/modern-go/reflect2
- kind: go_module
  url: github:munnerz/goautoneg.git
  module: github.com/munnerz/goautoneg
- kind: go_module
  url: github:oklog/ulid.git
  module: github.com/oklog/ulid/v2
- kind: go_module
  url: github:package-url/packageurl-go.git
  module: github.com/package-url/packageurl-go
- kind: go_module
  url: github:pmezard/go-difflib.git
  module: github.com/pmezard/go-difflib
- kind: go_module
  url: github:rcrowley/go-metrics.git
  module: github.com/rcrowley/go-metrics
- kind: go_module
  url: github:russross/blackfriday.git
  module: github.com/russross/blackfriday/v2
- kind: go_module
  url: github:santhosh-tekuri/jsonschema.git
  module: github.com/santhosh-tekuri/jsonschema/v6
- kind: go_module
  url: github:secure-systems-lab/go-securesystemslib.git
  module: github.com/secure-systems-lab/go-securesystemslib
- kind: go_module
  url: github:segmentio/asm.git
  module: github.com/segmentio/asm
- kind: go_module
  url: github:shibumi/go-pathspec.git
  module: github.com/shibumi/go-pathspec
- kind: go_module
  url: github:sigstore/protobuf-specs.git
  module: github.com/sigstore/protobuf-specs
- kind: go_module
  url: github:sigstore/rekor.git
  module: github.com/sigstore/rekor
- kind: go_module
  url: github:sigstore/rekor-tiles.git
  module: github.com/sigstore/rekor-tiles/v2
- kind: go_module
  url: github:sigstore/sigstore.git
  module: github.com/sigstore/sigstore
- kind: go_module
  url: github:sigstore/timestamp-authority.git
  module: github.com/sigstore/timestamp-authority/v2
- kind: go_module
  url: github:tchap/go-patricia.git
  module: github.com/tchap/go-patricia/v2
- kind: go_module
  url: github:theupdateframework/go-tuf.git
  module: github.com/theupdateframework/go-tuf/v2
- kind: go_module
  url: github:tonistiigi/dchapes-mode.git
  module: github.com/tonistiigi/dchapes-mode
- kind: go_module
  url: github:tonistiigi/units.git
  module: github.com/tonistiigi/units
- kind: go_module
  url: github:tonistiigi/vt100.git
  module: github.com/tonistiigi/vt100
- kind: go_module
  url: github:transparency-dev/formats.git
  module: github.com/transparency-dev/formats
- kind: go_module
  url: github:transparency-dev/merkle.git
  module: github.com/transparency-dev/merkle
- kind: go_module
  url: github:valyala/fastjson.git
  module: github.com/valyala/fastjson
- kind: go_module
  url: github:vektah/gqlparser.git
  module: github.com/vektah/gqlparser/v2
- kind: go_module
  url: github:x448/float16.git
  module: github.com/x448/float16
- kind: go_module
  url: github:xeipuuv/gojsonpointer.git
  module: github.com/xeipuuv/gojsonpointer
- kind: go_module
  url: github:xeipuuv/gojsonreference.git
  module: github.com/xeipuuv/gojsonreference
- kind: go_module
  url: github:xhit/go-str2duration.git
  module: github.com/xhit/go-str2duration/v2
- kind: go_module
  url: github:yashtewari/glob-intersection.git
  module: github.com/yashtewari/glob-intersection
- kind: go_module
  url: github:youmark/pkcs8.git
  module: github.com/youmark/pkcs8
- kind: go_module
  url: github:open-telemetry/opentelemetry-go-instrumentation.git
  module: go.opentelemetry.io/auto/sdk
- kind: go_module
  url: github:open-telemetry/opentelemetry-go-contrib.git
  module: go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc
- kind: go_module
  url: github:open-telemetry/opentelemetry-go-contrib.git
  module: go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlptrace
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp
- kind: go_module
  url: github:open-telemetry/opentelemetry-go.git
  module: go.opentelemetry.io/otel/sdk/metric
- kind: go_module
  url: github:open-telemetry/opentelemetry-proto-go.git
  module: go.opentelemetry.io/proto/otlp
- kind: go_module
  url: github:yaml/go-yaml.git
  module: go.yaml.in/yaml/v2
- kind: go_module
  url: github:yaml/go-yaml.git
  module: go.yaml.in/yaml/v4
- kind: go_module
  url: github:golang/net.git
  module: golang.org/x/net
- kind: go_module
  url: github:golang/oauth2.git
  module: golang.org/x/oauth2
- kind: go_module
  url: github:golang/time.git
  module: golang.org/x/time
- kind: go_module
  url: github:golang/tools.git
  module: golang.org/x/tools
- kind: go_module
  url: github:googleapis/go-genproto.git
  module: google.golang.org/genproto/googleapis/api
- kind: go_module
  url: https://gopkg.in/inf.v0
  module: gopkg.in/inf.v0
- kind: go_module
  url: https://gopkg.in/yaml.v3
  module: gopkg.in/yaml.v3
- kind: go_module
  url: github:kubernetes/klog.git
  module: k8s.io/klog/v2
- kind: go_module
  url: github:kubernetes/kube-openapi.git
  module: k8s.io/kube-openapi
- kind: go_module
  url: github:kubernetes/streaming.git
  module: k8s.io/streaming
- kind: go_module
  url: github:kubernetes/utils.git
  module: k8s.io/utils
- kind: go_module
  url: github:kubernetes-sigs/json.git
  module: sigs.k8s.io/json
- kind: go_module
  url: github:kubernetes-sigs/randfill.git
  module: sigs.k8s.io/randfill
- kind: go_module
  url: github:kubernetes-sigs/structured-merge-diff.git
  module: sigs.k8s.io/structured-merge-diff/v6
- kind: go_module
  url: github:kubernetes-sigs/yaml.git
  module: sigs.k8s.io/yaml
