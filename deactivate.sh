#! /usr/bin/env bash
set -euxo pipefail
(( ! $#   ))
(( ! $UID ))

DOCKERHOOK=dockerhook

sv stop    "$DOCKERHOOK"
sv down    "$DOCKERHOOK"
sv disable "$DOCKERHOOK"
rm -v "/var/service/$DOCKERHOOK"

