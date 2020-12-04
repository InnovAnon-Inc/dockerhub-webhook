#! /usr/bin/env bash
set -euxo pipefail
(( $UID ))
(( ! $# ))

docker pull innovanon/virtual-temple:latest

docker service update                     \
  --with-registry-auth                    \
  --force                                 \
  --image innovanon/virtual-temple:latest \
  virtual-temple_virtual-temple

