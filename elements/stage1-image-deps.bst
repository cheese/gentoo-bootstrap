kind: stack

depends:
- components/portage.bst
- components/eselect.bst
- components/binutils-config.bst
- components/gcc-config.bst
- components/elt-patches.bst
- db-pkg.bst
- components/gnuconfig.bst
- components/meson-format-array.bst
- components/mpc.bst
- freedesktop-sdk.bst:components/bash-config.bst
- freedesktop-sdk.bst:components/bison.bst
- freedesktop-sdk.bst:components/flex.bst
- freedesktop-sdk.bst:components/mpfr.bst
- freedesktop-sdk.bst:components/gmp.bst
- freedesktop-sdk.bst:components/ca-certificates.bst
- freedesktop-sdk.bst:components/shadow.bst
- freedesktop-sdk.bst:components/rsync.bst
- freedesktop-sdk.bst:components/texinfo.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:components/xmlto.bst

- freedesktop-sdk.bst:components/audit.bst
- freedesktop-sdk.bst:components/gperf.bst
- freedesktop-sdk.bst:components/m4.bst
- freedesktop-sdk.bst:components/libcap.bst
- freedesktop-sdk.bst:components/libgcrypt.bst
- freedesktop-sdk.bst:components/libgpg-error.bst
- freedesktop-sdk.bst:components/libseccomp.bst
- freedesktop-sdk.bst:components/lz4.bst
- freedesktop-sdk.bst:components/zstd.bst
- freedesktop-sdk.bst:components/util-linux-full.bst
- freedesktop-sdk.bst:components/linux-pam.bst
- freedesktop-sdk.bst:components/kmod.bst
- freedesktop-sdk.bst:components/pyelftools.bst
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/cryptsetup-lvm2-stage1.bst
- freedesktop-sdk.bst:components/p11-kit.bst
- freedesktop-sdk.bst:components/libfido2.bst
- freedesktop-sdk.bst:components/libidn2.bst
- freedesktop-sdk.bst:components/openssl.bst
- freedesktop-sdk.bst:components/python3-jinja2.bst
- freedesktop-sdk.bst:components/apparmor.bst
- freedesktop-sdk.bst:components/tpm2-tss.bst
- freedesktop-sdk.bst:components/curl.bst
- freedesktop-sdk.bst:components/libqrencode.bst
- freedesktop-sdk.bst:components/iptables.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst

- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
#- cross-compilers/gcc-i686.bst

public:
  bst:
    integration-commands:
    - |
      groupadd root -r -g 0
      useradd root -rm -u 0 -g 0 -d /root
      groupadd portage -r -g 250
      useradd portage -rm -u 250 -g 250 -d /var/tmp/portage -s /sbin/nologin
      groupadd messagebus -r -g 101
      useradd messagebus -rm -u 101 -g 101 -d /dev/null -s /sbin/nologin
      groupadd nobody -r -g 65534

    - mkdir -p /var/cache/distfiles
