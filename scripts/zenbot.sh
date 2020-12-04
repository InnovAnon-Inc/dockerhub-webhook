#! /usr/bin/env bash
set -euxo pipefail
(( $UID ))
(( ! $# ))

docker pull mongo:latest
docker pull mrvautin/adminmongo
docker pull fculpo/zenbot:latest

docker service update          \
  --with-registry-auth         \
  --force                      \
  --image mongo:latest         \
  zenbot_monodb
docker service update          \
  --with-registry-auth         \
  --force                      \
  --image mrvautin/adminmongo  \
  zenbot_adminmongo
docker service update          \
  --with-registry-auth         \
  --force                      \
  --image fculpo/zenbot:latest \
  zenbot_server

