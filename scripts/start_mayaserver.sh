#!/bin/bash

set -e

SELF_IPV4=$1

if [ $# -ne "" ]; then
   SELF_IP4=127.0.0.1
fi

echo "Setup Mayaserver Daemon ..."

# Place systemd service template for Mayaserver
sudo cp /etc/maya.d/templates/mayaserver.service.tmpl /etc/systemd/system/mayaserver.service

# Replace the placeholders with actual values
sudo sed -e "s|__SELF_IPV4__|$SELF_IPV4|g" -i /etc/systemd/system/mayaserver.service 

echo "Starting Mayaserver service ..."

sudo systemctl enable mayaserver.service
sudo systemctl restart mayaserver.service
