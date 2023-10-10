kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:dol-sen/pyDeComp.git
  track: '*'
  ref: 0.3-0-gae2624862d165fcfa09a6c88d51671e60ca68936
