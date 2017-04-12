#!/bin/bash

echo "Starting Apache"

if ! pidof apache2 > /dev/null
then
    echo "Apache web server  is down, Trying auto-restart"

    /etc/init.d/apache2 restart > /dev/null

    if pidof apache2 > /dev/null
    then
        message="Apache restarted successfully"
    else
        message="Restart Failed, try restarting manually"
    fi
    echo "$message" -r "$SENDEREMAIL" "$NOTIFYEMAIL"
fi

echo "  Done"