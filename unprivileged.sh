#!/usr/bin/env bash

# setting a new npm-global directory (resolving: https://docs.npmjs.com/getting-started/fixing-npm-permissions)
mkdir -p ~/npm-global
npm config set prefix '~/npm-global'
echo "export PATH=~/npm-global/bin:$PATH" > ~/.profile
source ~/.profile

# installing Npm packages
echo "Installing Npm packages..."
npm install -g bower
npm install -g grunt-cli
npm install -g gulp
echo "... done."

# fixing NODE_PATH to avoid issues with Yo
echo "export NODE_PATH=$NODE_PATH:~/npm-global/lib/node_modules" >> ~/.bashrc
source ~/.bashrc

# fixing NPM symbolik link problems in windows hosts
echo "alias npmi='npm install --no-bin-links'" >> ~/.profile
source ~/.profile

# clearing the cache solves some tar.unpack problems... (details: https://github.com/npm/npm/issues/5133)
echo "Clearing NPM cache..."
npm cache clean
echo "... done."