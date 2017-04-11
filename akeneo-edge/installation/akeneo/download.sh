#!/bin/bash
set -e

PIM_VERSION=1.7.0

echo "Downloading PIM ${PIM_VERSION} Community Eedition"

echo "  - Install wget"
apt-get update
apt-get install -yq wget
echo "    Done."

echo "  - Download PIM archive"
wget  https://github.com/akeneo/pim-community-standard/archive/v${PIM_VERSION}.tar.gz
echo "    Done."

ls -la 
echo "  - Unpacking PIM archive"
tar -xzf v${PIM_VERSION}.tar.gz
echo "    Done."

echo "  - Move archive to /akeneo"
mv pim-community-standard-${PIM_VERSION} /akeneo
echo "    Done."

echo "  - Chaning file mode"
chmod 775 -R /akeneo
echo "  - Done."