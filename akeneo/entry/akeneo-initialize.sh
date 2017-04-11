#!/bin/bash

echo "  - Installing Akeneo PIM using console"
cd /akeneo
php app/console pim:install --env=prod
echo "  - Done."

echo "  - Change owner of Akeneo Wev to www-data"
chown www-data:www-data /akeneo/app/cache/ -R
chown www-data:www-data /akeneo/app/logs/ -R
echo "  - Done."