#!/bin/bash

echo "Cleaning up after install"

echo "  - Removing installation folder"
rm -rf /installation
echo "    Done."

echo "Removing package cache"
apt-get clean
rm -rf /var/lib/apt/lists/*
echo "    Done."