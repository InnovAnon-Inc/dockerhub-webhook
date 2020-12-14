#! /usr/bin/env bash
set -euxo pipefail
(( $UID ))
(( ! $# ))

docker pull threatsimple/smug:latest

docker service update           \
  --with-registry-auth          \
  --force                       \
  --image threatsimple/smug:latest \
  smug-broker_smug-broker

