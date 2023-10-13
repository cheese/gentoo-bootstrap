kind: junction

config:
  options:
    target_arch: "%{arch}"

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: 'freedesktop-sdk-23.08.*'
  ref: freedesktop-sdk-23.08.3-0-gd58cbd03841cdf4d914151c5970c1695395240a7
- kind: patch_queue
  path: patches/freedesktop-sdk
