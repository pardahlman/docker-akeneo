#!/bin/bash

# The 'parameters.yml' file can override Akeneo defaults
# Available parameters: https://github.com/akeneo/pim-community-dev/blob/master/app/config/pim_parameters.yml

cat << EOF > /akeneo/app/config/parameters.yml
parameters:
  database_driver: pdo_mysql
  database_host: ${DATABASE_HOST}
  database_port: ${DATABASE_PORT}
  database_name: ${DATABASE_NAME}
  database_user: ${DATABASE_USER}
  database_password: ${DATABASE_PASSWORD}
  locale: en
  secret: ThisTokenIsNotSoSecretChangeIt
  installer_data: PimInstallerBundle:minimal
EOF