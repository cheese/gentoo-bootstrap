kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-flit.bst

depends:
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:hukkin/tomli.git
  track: '*'
  ref: 2.0.1-0-g36ef51d6a5a55e0eca077b58695390d041061bd4
