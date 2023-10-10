kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-flit.bst

depends:
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:pkgcore/snakeoil.git
  track: 'v*'
  ref: v0.10.5-0-gc0ca221cd9c6e3970a2baaa732289f65afdaca7c
