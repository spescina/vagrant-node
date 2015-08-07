#!/usr/bin/env bash

# Linking npm@3
sudo rm /usr/bin/npm
sudo ln -s /home/vagrant/npm-global/lib/node_modules/npm/bin/npm-cli.js npm
echo "... done."