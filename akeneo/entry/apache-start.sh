#!/bin/bash

echo "Starting Apache"

if ! pidof apache2 > /dev/null
then
    echo "Apache web server is down, Trying auto-restart"

    /etc/init.d/apache2 restart > /dev/null

    if pidof apache2 > /dev/null
    then
        echo "Apache restarted successfully"
    else
        echo "Restart Failed, try restarting manually"
    fi
fi

echo "  Done"
