kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- freedesktop-sdk.bst:components/asciidoc.bst

depends:
- components/python-libmount.bst
- components/python-snakeoil.bst
- components/python-fasteners.bst
- components/python-tomli.bst
- components/python-dol-sen-pydecomp.bst
- components/portage.bst

runtime-depends:
- components/pixz.bst

config:
  build-commands:
    (<):
    # build the man pages and docs
    - make

  install-commands:
    (>):
    # install configs
    - |
      mkdir -p %{install-root}%{sysconfdir}/catalyst
      cp -v etc/* %{install-root}%{sysconfdir}/catalyst

sources:
- kind: git_repo
  url: github:gentoo/catalyst.git
  track: master
  ref: catalyst-4.0-branchpoint-384-g1abd94188e9e9eecd5fe16de3aeaceebac1ec4e0
