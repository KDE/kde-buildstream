# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Inspired by ArchLinux's PKGBUILD: https://gitlab.archlinux.org/archlinux/packaging/packages/docker/-/raw/main/PKGBUILD?ref_type=heads
kind: manual

description: Pack, ship and run any application as a lightweight container

build-depends:
- freedesktop-sdk.bst:components/btrfs-progs.bst
- freedesktop-sdk.bst:components/cmake.bst
- freedesktop-sdk.bst:components/go-md2man.bst
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:components/libapparmor.bst
- freedesktop-sdk.bst:components/libseccomp.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/sed.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- freedesktop-sdk.bst:components/btrfs-progs.bst
- freedesktop-sdk.bst:components/iproute2.bst
- freedesktop-sdk.bst:components/iptables.bst
- freedesktop-sdk.bst:components/libapparmor.bst
- freedesktop-sdk.bst:components/libdevmapper.bst
- freedesktop-sdk.bst:components/libseccomp.bst
- freedesktop-sdk.bst:components/sqlite.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands:
  - |
    export VERSION=29.6.1
    export GOPATH="${PWD}/.gopath"
    export PATH="${GOPATH}/bin:${PATH}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export LDFLAGS=''
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-compressdwarf=false -ldflags=-B=gobuildid'
    export GO111MODULE=off
    export DISABLE_WARN_OUTSIDE_CONTAINER=1

    mkdir -p "${GOPATH}/src/github.com/docker" "${GOPATH}/src/github.com/moby/moby" "${GOPATH}/src/github.com/krallin"
    ln -rsT cli "${GOPATH}/src/github.com/docker/cli"
    ln -rsT moby "${GOPATH}/src/github.com/moby/moby/v2"
    ln -rsT tini "${GOPATH}/src/github.com/krallin/tini"

    cd "${GOPATH}/src/github.com/docker/cli"
    make VERSION="${VERSION}" dynbinary
    make manpages

    cd "${GOPATH}/src/github.com/moby/moby/v2"
    DOCKER_GITCOMMIT=5259f1f \
      DOCKER_BUILDTAGS='seccomp journald apparmor' \
      VERSION="${VERSION}" \
      hack/make.sh dynbinary

    cd "${GOPATH}/src/github.com/krallin/tini"
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .
    make tini-static
  install-commands:
  - |
    install -Dm755 tini/tini-static "%{install-root}%{bindir}/docker-init"
    install -Dm755 moby/bundles/dynbinary-daemon/dockerd "%{install-root}%{bindir}/dockerd"
    install -Dm755 moby/bundles/dynbinary-daemon/docker-proxy "%{install-root}%{bindir}/docker-proxy"

    install -Dm644 moby/contrib/init/systemd/docker.service "%{install-root}%{prefix}/lib/systemd/system/docker.service"
    install -Dm644 moby/contrib/init/systemd/docker.socket "%{install-root}%{prefix}/lib/systemd/system/docker.socket"
    install -Dm644 docker.sysusers "%{install-root}%{prefix}/lib/sysusers.d/docker.conf"

    install -Dm755 cli/build/docker "%{install-root}%{bindir}/docker"

    cli/build/docker completion bash > docker.bash
    cli/build/docker completion zsh > docker.zsh
    cli/build/docker completion fish > docker.fish
    install -Dm644 docker.bash "%{install-root}%{datadir}/bash-completion/completions/docker"
    install -Dm644 docker.zsh "%{install-root}%{datadir}/zsh/site-functions/_docker"
    install -Dm644 docker.fish "%{install-root}%{datadir}/fish/vendor_completions.d/docker.fish"

    install -dm755 "%{install-root}%{mandir}"
    cp -r cli/man/man* "%{install-root}%{mandir}"

sources:
- kind: git_repo
  url: github:docker/cli.git
  track: 'v*'
  ref: v29.6.2-0-gdfc4efb1e2ab8c06d70d2a1366ad448d2f917e90
  directory: cli
- kind: git_repo
  url: github:moby/moby.git
  track: 'docker-v*'
  ref: docker-v29.6.2-0-g3d80467678f6e36325fa9ae3dd486fe91e5652e3
  directory: moby
- kind: git_repo
  url: github:krallin/tini.git
  track: 'v*'
  ref: v0.19.0-0-gde40ad007797e0dcd8b7126f27bb87401d224240
  directory: tini
- kind: remote
  url: https://gitlab.archlinux.org/archlinux/packaging/packages/docker/-/raw/main/docker.sysusers?ref_type=heads
  ref: 541826011a9836d05a2f42293d5f1beadf2ca8d89fb604487d61a013505678eb
  filename: docker.sysusers
