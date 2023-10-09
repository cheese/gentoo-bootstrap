kind: autotools
description: GNU wget

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/gnutls.bst
- freedesktop-sdk.bst:components/libidn2.bst
- freedesktop-sdk.bst:components/libpsl.bst
- freedesktop-sdk.bst:components/libunistring.bst
- freedesktop-sdk.bst:components/nettle.bst
- freedesktop-sdk.bst:components/util-linux.bst

build-depends:
- freedesktop-sdk.bst:components/gettext.bst
- freedesktop-sdk.bst:components/flex.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/python3.bst

variables:
  conf-local: >-
    --disable-rpath

sources:
- kind: tar
  url: ftp_gnu_org:wget/wget-1.21.tar.lz
  ref: 87ae105e76e5b550e03e009ba94341143c66623a5ecbba047f6ef850608b6596
