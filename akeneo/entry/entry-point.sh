#!/bin/bash

set -e

echo "Installing PIM"

source /entry/initializing-akeneo.sh

echo "  - Installing Akeneo PIM using console"
cd /akeneo
php app/console pim:install --env=prod
echo "  - Done."

echo "  - Changing owner of akeneo dir"
chown www-data:www-data /akeneo/ -R
echo "  - Done."

source /entry/starting-apache.sh