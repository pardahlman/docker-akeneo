#!/bin/bash
set -e

PIM_VERSION=1.7

echo "Downloading PIM ${PIM_VERSION} Community Eedition"

echo "  - Install wget"
apt-get update
apt-get install -yq wget
echo "    Done."

echo "  - Download PIM archive"
wget https://download.akeneo.com/pim-community-standard-v${PIM_VERSION}-latest-icecat.tar.gz
echo "    Done."

echo "  - Unpacking PIM archive"
tar -xzf pim-community-standard-v${PIM_VERSION}-latest-icecat.tar.gz
echo "    Done."

echo "  - Move archive to /akeneo"
mv pim-community-standard /akeneo
echo "    Done."

echo "  - Chaning file mode"
chmod 775 -R /akeneo
echo "  - Done."