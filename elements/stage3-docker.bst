kind: import

public:
  bst:
    split-rules:
      db:
      - "/var/db/pkg/**"

sources:
- kind: docker
  registry-url: "docker_registry:"
  image: gentoo/stage3
  track: systemd
  architecture: "amd64"
  ref: ace66beb9fa2651e300406b9033ae26d8f46da39f76511cb37acbf2273ec8766
