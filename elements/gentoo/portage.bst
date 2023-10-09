kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
#- components/cython.bst
#- components/git-minimal.bst
#- components/python3-packaging.bst

depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/patch.bst

runtime-depends:
- gentoo/wget.bst
- freedesktop-sdk.bst:components/tar.bst
- freedesktop-sdk.bst:components/util-linux-full.bst
- freedesktop-sdk.bst:components/zstd.bst
# - components/buildbox-casd.bst
# - components/buildbox-run-bubblewrap.bst
# - components/buildbox-fuse.bst
# - components/python3-arpy.bst
# - components/python3-blessings.bst
# - components/python3-click.bst
# - components/python3-dateutil.bst
# - components/python3-dulwich.bst
# - components/python3-grpcio.bst
# - components/python3-jinja2.bst
# - components/python3-pluginbase.bst
# - components/python3-psutil.bst
# - components/python3-pyroaring.bst
# - components/python3-ruamel-yaml.bst
# - components/python3-ujson.bst

config:
  install-commands:
    (>):
    - mkdir -p '%{install-root}%{sysconfdir}/portage'

sources:
- kind: git_repo
  url: github:gentoo/portage.git
  track: 'portage-*.*.*'
  ref: portage-3.0.51-0-g863c4a6e8d01218e8ac56c523a7951b67ca48297
