kind: junction

config:
  options:
    target_arch: "%{arch}"

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: 'freedesktop-sdk-23.08.*'
  ref: freedesktop-sdk-23.08.2-0-geb7333990bfdede7e8dfbd5efae25c11228b78c0
- kind: patch_queue
  path: patches/freedesktop-sdk
