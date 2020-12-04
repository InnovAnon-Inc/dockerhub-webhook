#! /usr/bin/env bash
set -euxo pipefail
(( ! $#   ))
(( ! $UID ))

DOCKERHOOK=dockerhook

./deactivate.sh
rm -rf "/etc/sv/$DOCKERHOOK"

chown -R "$DOCKERHOOK:$DOCKERHOOK" "/srv/$DOCKERHOOK"
userdel -r "$DOCKERHOOK"

