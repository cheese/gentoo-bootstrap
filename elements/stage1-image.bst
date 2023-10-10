kind: compose

build-depends:
- stage1-image-deps.bst

config:
  exclude:
  - debug
  include-orphans: True
