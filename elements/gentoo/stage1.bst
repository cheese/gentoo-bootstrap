kind: compose

build-depends:
- gentoo/stage1-deps.bst

config:
  exclude:
  - debug
  include-orphans: True
