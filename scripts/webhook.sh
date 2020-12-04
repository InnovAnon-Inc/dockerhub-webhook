#! /usr/bin/env bash
set -euxo pipefail
(( $UID ))
(( ! $# ))

docker pull maccyber/micro-dockerhub-hook

docker service update                   \
  --with-registry-auth                  \
  --force                               \
  --image maccyber/micro-dockerhub-hook \
  dockerhub-webhook_dockerhub

