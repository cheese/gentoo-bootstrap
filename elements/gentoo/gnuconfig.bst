kind: script

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

config:
  commands:
  - mkdir -p %{install-root}/%{datadir}/gnuconfig
  - cp -a %{datadir}/gnu-config/* %{install-root}/%{datadir}/gnuconfig
  - chmod +x %{install-root}/%{datadir}/gnuconfig/*
