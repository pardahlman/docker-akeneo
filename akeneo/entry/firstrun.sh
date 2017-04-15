#!/bin/bash
echo "Installing application"
ls -la /
source /entry/envvars.sh
source /entry/akeneo-create-parameters.sh
source /entry/akeneo-initialize.sh
echo "  - Done!"