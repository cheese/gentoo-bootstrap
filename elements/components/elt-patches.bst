kind: make

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

runtime-depends:
- components/gentoo-functions.bst

sources:
- kind: git_repo
  url: github:gentoo/elt-patches.git
  track: '*'
  ref: 20221210-0-g7ff3d75742a3560333334af9c92b282a99cc1486
