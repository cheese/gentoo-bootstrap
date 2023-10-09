kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

config:
  install-commands:
  - install -m 755 -D meson-format-array %{install-root}%{bindir}/meson-format-array

sources:
- kind: local
  path: files/meson-format-array/meson-format-array
