#!/bin/bash

source /installation/env-vars.sh

echo "Installing Composer Packages for Akeneo PIM (${PIM_INSTALL_DIR})"
cd ${PIM_INSTALL_DIR}
composer install --optimize-autoloader --prefer-dist  # optional for community edition