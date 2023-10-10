kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:harlowja/fasteners.git
  track: '*'
  ref: 0.19-0-g06c3f06cab4e135b8d921932019a231c180eb9f4
