kind: make

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

config:
  install-commands:
    (>):
    - mkdir -p '%{install-root}%{prefix}'
    - mv '%{install-root}/lib' %{install-root}%{prefix}
    - mv '%{install-root}/sbin' %{install-root}%{bindir}


sources:
- kind: git_repo
  url: github:gentoo/gentoo-functions.git
  track: '*'
  ref: 0.19-0-geba1e10cf534577d62e6c007708ab1b517108911
