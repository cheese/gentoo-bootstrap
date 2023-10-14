kind: make

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

sources:
- kind: git_repo
  url: github:gentoo/gcc-config.git
  track: 'v*'
  ref: v2.11-0-g6d83aec7a8d26035d81b1cafdf007135aa4ea094
