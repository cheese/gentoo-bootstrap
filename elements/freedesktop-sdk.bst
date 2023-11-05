kind: junction

config:
  options:
    target_arch: "%{arch}"

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: cheeselee/loongarch64-minimal-vm
  ref: freedesktop-sdk-23.08rc.2-526-g4cf8c70cf6f691e29c64892b3b0270abe959bdee
- kind: patch_queue
  path: patches/freedesktop-sdk
