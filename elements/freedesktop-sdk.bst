kind: junction

config:
  options:
    target_arch: "%{arch}"

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: 'freedesktop-sdk-23.08.*'
  ref: freedesktop-sdk-23.08.4-0-gadbdb230b583c20a099a8c36f045a15ec4663616
- kind: patch_queue
  path: patches/freedesktop-sdk
