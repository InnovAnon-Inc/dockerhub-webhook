#! /usr/bin/env bash
set -euxo pipefail
(( ! $#   ))
(( ! $UID ))

DOCKERHOOK=dockerhook

trap "userdel -r $DOCKERHOOK" 0

useradd                      \
 -G docker -k /dev/null -m   \
 -d "/srv/$DOCKERHOOK"       \
 -s "/srv/$DOCKERHOOK/shell" \
 "$DOCKERHOOK"

( trap                         "rm -f /srv/$DOCKERHOOK/install.sh" 0
  cp    -v install-2.sh              "/srv/$DOCKERHOOK/install.sh"
  chmod -v +x                        "/srv/$DOCKERHOOK/install.sh"
  sudo  -u "$DOCKERHOOK"             "/srv/$DOCKERHOOK/install.sh" )
# chsh                            -s "/srv/$DOCKERHOOK/shell" "$DOCKERHOOK" )

mkdir -v        "/etc/sv/$DOCKERHOOK"
#cp    -v    run "/etc/sv/$DOCKERHOOK"
sed "s/dockerhook/$DOCKERHOOK/g" run > \
                "/etc/sv/$DOCKERHOOK/run"
chmod -v +x     "/etc/sv/$DOCKERHOOK/run"
#ln    -v -s     /etc/sv/$DOCKERHOOK /var/service/
#sv enable $DOCKERHOOK
#sv start  $DOCKERHOOK

# TODO cleanup user on failure
trap "rm -rf /etc/sv/$DOCKERHOOK" 0

cp    -v -r .env               "/srv/$DOCKERHOOK/"
chmod -v 0550                  "/srv/$DOCKERHOOK/.env"   /srv/$DOCKERHOOK/scripts/*  "/srv/$DOCKERHOOK/scripts" "/srv/$DOCKERHOOK/shell"
chmod -v 0770                  "/srv/$DOCKERHOOK/log"
chmod -v 0440                   /srv/$DOCKERHOOK/.env/* "/srv/$DOCKERHOOK/config.py"
chown -v -R "root:$DOCKERHOOK" "/srv/$DOCKERHOOK/.env"  "/srv/$DOCKERHOOK/config.py" "/srv/$DOCKERHOOK/scripts" "/srv/$DOCKERHOOK/shell"

trap "" 0

