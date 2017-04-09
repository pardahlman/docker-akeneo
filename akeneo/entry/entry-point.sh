#!/bin/bash

set -e

echo "Installing PIM"

source /entry/configure-akeneo.sh

echo "  - Installing Akeneo PIM using console"
php /akeneo/app/console pim:install --env=prod
echo "  - Done."

echo "  - Changing owner of akeneo dir"
chown www-data:www-data /akeneo/ -R
echo "  - Done."

source /entry/start-apache.sh