#! /usr/bin/env bash
set -euxo pipefail
(( ! $#   ))
(( ! $UID ))

DOCKERHOOK=dockerhook

ln -v -s "/etc/sv/$DOCKERHOOK" /var/service/
sv enable "$DOCKERHOOK"
sv up     "$DOCKERHOOK"
sv start  "$DOCKERHOOK"

