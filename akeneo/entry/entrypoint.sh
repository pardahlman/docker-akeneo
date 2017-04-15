#!/bin/bash

set -e

FIRST_RUN_FILE=/entry/firstrun.sh

if [ -f ${FIRST_RUN_FILE} ]
then
    echo "This is the first time the container is run. Initialize."
    source ${FIRST_RUN_FILE}
    rm ${FIRST_RUN_FILE}
else
    echo "The container is starting up again. Assuming application is initialized."
fi

source /entry/apache-start.sh

tail -f /akeneo/app/logs/prod.log