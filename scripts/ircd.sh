#! /usr/bin/env bash
set -euxo pipefail
(( $UID ))
(( ! $# ))

docker pull innovanon/ircd:latest

docker service update           \
  --with-registry-auth          \
  --force                       \
  --image innovanon/ircd:latest \
  ircd_ircd

docker service update           \
  --with-registry-auth          \
  --force                       \
  --image innovanon/ircd:latest \
  ircd-ssl_ircd-ssl

