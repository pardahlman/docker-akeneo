#!/bin/bash

echo "Configuring Apache"
echo "  - Setting default site"
mv -f /installation/apache2/site.conf /etc/apache2/sites-enabled/000-default.conf
echo "  - Done."