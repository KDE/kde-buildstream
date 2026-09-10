# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:components/libmnl.bst
- freedesktop-sdk.bst:components/libnftnl.bst

sources:
- kind: git_repo
  url: netfilter:iptables
  track: v*
  ref: v1.8.13-0-gafd52551c98871b8ac0321eed8efa0845956037c

config:
  install-commands:
    (>):
    - |
      for command in \
        iptables iptables-restore iptables-save \
        ip6tables ip6tables-restore ip6tables-save
      do
        ln -sfn xtables-nft-multi \
          "%{install-root}%{bindir}/${command}"
      done
