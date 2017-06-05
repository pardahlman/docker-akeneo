#!/bin/bash

set -e

echo "Running PHP install script"

echo "  - Move php.ini"
mv /installation/php/php.ini /usr/local/etc/php/php.ini
echo "    Done."

# Akeneo PIM requires the following PHP extensions
# https://docs.akeneo.com/1.5/developer_guide/installation/system_requirements/system_requirements.html

echo "  - Installing PHP extensions"

apt-get update

apt-get install -y libzip-dev
docker-php-ext-install zip

apt-get install -y libcurl4-gnutls-dev
docker-php-ext-install curl

apt-get install -y libmcrypt-dev
docker-php-ext-install mcrypt

apt-get install -y libicu-dev
docker-php-ext-install intl

apt-get install -y libpng12-dev
apt-get install -y libjpeg-dev
docker-php-ext-configure gd --with-jpeg-dir=/usr/include/
docker-php-ext-install gd

pecl install apcu-4.0.11
echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini

apt-get install php5-mysql -y
docker-php-ext-install pdo_mysql
docker-php-ext-install mysqli
docker-php-ext-install exif


echo "    Done."