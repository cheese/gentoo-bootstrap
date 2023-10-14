kind: make

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

sources:
- kind: git_repo
  url: github:gentoo/binutils-config.git
  track: 'v*'
  ref: v5.5-0-g0c8928b6b49603c0a3e0bcf1640da708865d20fe
