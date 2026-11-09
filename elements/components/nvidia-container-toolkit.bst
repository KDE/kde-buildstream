# SPDX-FileCopyrightText: 2026 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

kind: manual

description: NVIDIA Container Toolkit

build-depends:
- components/libnvidia-container.bst
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

depends:
- components/libnvidia-container.bst
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands:
  - |
    export GOFLAGS='-buildmode=pie -trimpath -mod=vendor'
    make binaries VERSION=1.20.1 GIT_COMMIT=dffc40b4f820ce5c512633bac9e0418d0e05a2ee
  install-commands:
  - |
    install -Dm755 nvidia-container-runtime "%{install-root}%{bindir}/nvidia-container-runtime"
    install -Dm755 nvidia-container-runtime.cdi "%{install-root}%{bindir}/nvidia-container-runtime.cdi"
    install -Dm755 nvidia-container-runtime.legacy "%{install-root}%{bindir}/nvidia-container-runtime.legacy"
    install -Dm755 nvidia-container-runtime-hook "%{install-root}%{bindir}/nvidia-container-runtime-hook"
    install -Dm755 nvidia-cdi-hook "%{install-root}%{bindir}/nvidia-cdi-hook"
    install -Dm755 nvidia-ctk "%{install-root}%{bindir}/nvidia-ctk"
    install -Dm644 deployments/systemd/nvidia-cdi-refresh.service "%{install-root}%{prefix}/lib/systemd/system/nvidia-cdi-refresh.service"
    install -Dm644 deployments/systemd/nvidia-cdi-refresh.path "%{install-root}%{prefix}/lib/systemd/system/nvidia-cdi-refresh.path"
    install -Dm644 deployments/systemd/10-container-engines.conf "%{install-root}%{prefix}/lib/systemd/system/nvidia-cdi-refresh.service.d/10-container-engines.conf"
    install -Dm644 deployments/systemd/nvidia-cdi-refresh.env "%{install-root}%{sysconfdir}/nvidia-container-toolkit/nvidia-cdi-refresh.env"
    install -Dm644 deployments/systemd/90-nvidia-container-toolkit.preset "%{install-root}%{prefix}/lib/systemd/system-preset/90-nvidia-container-toolkit.preset"
    install -Dm644 LICENSE "%{install-root}%{datadir}/licenses/nvidia-container-toolkit/LICENSE"

sources:
- kind: git_repo
  url: github:NVIDIA/nvidia-container-toolkit.git
  track: v*
  exclude:
  - '*-rc*'
  ref: v1.20.1-0-gdffc40b4f820ce5c512633bac9e0418d0e05a2ee
