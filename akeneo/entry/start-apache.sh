#!/bin/bash

echo "Starting Apache"

source /etc/apache2/envvars
exec apache2 -D FOREGROUND