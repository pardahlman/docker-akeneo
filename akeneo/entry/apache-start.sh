#!/bin/bash

echo "Starting Apache"

source /etc/apache2/envvars
/etc/init.d/apache2 start

echo "  Done"