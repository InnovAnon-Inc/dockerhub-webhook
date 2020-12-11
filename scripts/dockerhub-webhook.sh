#! /usr/bin/env bash
set -euxo pipefail
(( $UID ))
(( ! $# ))

T="`mktemp -d`"
trap "rm -rf $T" 0
git clone --recursive --depth=1 https://github.com/InnovAnon-Inc/dockerhub-webhook.git "$T"
( cd "$T"
  sudo ./install.sh )

