#!/bin/bash
set -e

source /installation/env-vars.sh

echo "Downloading PIM ${PIM_VERSION} Community Edition and extracting it into ${PIM_INSTALL_DIR}"

echo "  - Install wget"
apt-get update -q
apt-get install -yq wget
echo "    Done."

echo "  - Download PIM archive"
wget https://download.akeneo.com/pim-community-standard-v${PIM_VERSION}-latest.tar.gz
echo "    Done."

echo "  - Unpacking PIM archive"
tar -xzf pim-community-standard-v${PIM_VERSION}-latest.tar.gz
mv -f pim-community-standard ${PIM_INSTALL_DIR}
echo "    Done."

echo "  - Changing file mode"
chmod 775 -R ${PIM_INSTALL_DIR}
echo "  - Done."