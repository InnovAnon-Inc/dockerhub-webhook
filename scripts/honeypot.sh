#! /usr/bin/env bash
set -euxo pipefail
(( $UID ))
(( ! $# ))

docker pull cowrie/cowrie:latest

docker service update          \
  --with-registry-auth         \
  --force                      \
  --image cowrie/cowrie:latest \
  cowrie_cowrie

