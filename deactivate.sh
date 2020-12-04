#! /usr/bin/env bash
set -euxo pipefail
(( ! $#   ))
(( ! $UID ))

DOCKERHOOK=dockerhook

sv down    "$DOCKERHOOK"
sv stop    "$DOCKERHOOK"
sv disable "$DOCKERHOOK"
rm -v "/var/service/$DOCKERHOOK"

