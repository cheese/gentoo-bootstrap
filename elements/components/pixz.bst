kind: autotools
description:  Parallel, indexed xz compressor

depends:
- freedesktop-sdk.bst:components/libarchive.bst

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/asciidoc.bst

sources:
- kind: git_repo
  url: github:vasi/pixz.git
  track: 'v*'
  ref: v1.0.7-0-g573e4a8d2c9cc600ffeb109683d5a5904aa8fa50
