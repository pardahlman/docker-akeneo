#!/bin/bash

case $1 in
    "install")
        echo "installing application"
        source /entry/env-vars.sh
        source /entry/akeneo-create-parameters.sh
        source /entry/akeneo-initialize.sh
        source /entry/apache-start.sh
        echo "done"
    ;;
    *)
        echo "No command given. Expecting application to be installed."
    ;;
esac

tail -f /var/log/apache2/access.log
