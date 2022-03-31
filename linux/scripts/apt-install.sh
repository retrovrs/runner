#! /bin/bash

# Root check
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

# Install packages
PACKAGES=$(grep -o '"name": "[^"]*' packages.json | grep -o '[^"]*$')
apt-get install -y --no-install-recommends $PACKAGES
