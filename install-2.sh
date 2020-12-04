#! /usr/bin/env bash
set -euxo pipefail
(( ! $#   ))
((   $UID ))
cd

T="$(mktemp -d)"
trap "rm -rf $T" 0
git clone --depth=1      \
  --recursive -b home    \
  https://github.com/InnovAnon-Inc/dockerhub-webhook.git "$T"
( cd "$T"
  tar --exclude-vcs -cf - . ) |
tar -C . -v         -xf -

python3 -m venv .venv
. .venv/bin/activate
pip install -U pip wheel
pip install -U dockerhub-webhook gunicorn

mkdir -v log

