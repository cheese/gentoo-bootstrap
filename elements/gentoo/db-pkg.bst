kind: compose

build-depends:
- gentoo/docker.bst

config:
  include:
    - db
  include-orphans: False

