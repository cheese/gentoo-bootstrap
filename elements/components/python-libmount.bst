kind: filter

build-depends:
- components/util-linux-base.bst

runtime-depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/util-linux-full.bst

config:
  include:
    - python-libmount
  include-orphans: False
