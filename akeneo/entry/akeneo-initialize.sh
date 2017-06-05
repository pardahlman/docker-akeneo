#!/bin/bash

echo "  - Installing Akeneo PIM using console"
cd /akeneo
php app/console pim:install --env=prod
echo "  - Done."

echo "  - Create log to tail"
touch aptail -f /akeneo/app/logs/prod.log
echo "  - Done"

echo "  - Change owner of Akeneo Wev to www-data"
chown www-data:www-data /akeneo/app/cache/ -R
chown www-data:www-data /akeneo/app/logs/ -R
chown www-data:www-data /akeneo/app/file_storage -R
chown www-data:www-data /akeneo/web -R
echo "  - Done."

echo "  - Creating OAuth Client Id (for API)"
php /akeneo/app/console pim:oauth-server:create-client
echo "  - Done."