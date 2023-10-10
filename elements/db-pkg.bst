kind: compose

build-depends:
- stage3-docker.bst

config:
  include:
    - db
  include-orphans: False

