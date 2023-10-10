kind: script

build-depends:
- freedesktop-sdk.bst:oci/oci-builder.bst
- catalyst-image-init-scripts.bst
- filename: freedesktop-sdk.bst:oci/bootstrap-oci.bst
  config:
    location: /parent
- filename: catalyst-image.bst
  config:
    location: /layer

config:
  commands:
  - |
    if [ -d /initial_scripts ]; then
      for i in /initial_scripts/*; do
        "${i}" /layer
      done
    fi
  - |
    cd "%{install-root}"
    build-oci <<EOF
    mode: docker
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Builder image for Freedesktop SDK with BuildStream 2"
      tags:
      - "github.com/cheese/catalyst:latest"
      config:
        Cmd: ["/bin/bash"]
    EOF
