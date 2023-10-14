kind: autotools

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
#- freedesktop-sdk.bst:components/asciidoc.bst

sources:
- kind: git_repo
  url: gentoo:eselect.git
  track: 'eselect-*'
  ref: eselect-1.4.27-0-g93d289022f27bde243c5632095f41905c4645ba7
