#!/usr/bin/env bash

# Updating
echo "Updating repositories..."
sudo apt-get update
echo "... done."

# Forcing locale
echo "Forcing locale..."
echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
sudo locale-gen en_US.UTF-8
sudo locale-gen it_IT.UTF-8
echo "... done."

# Set My Timezone
echo "Setting timezone..."
ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
echo "... done."

# Installing utilities
echo "Installing python-software-properties, vim, curl, git, build-essential..."
sudo apt-get install -qq build-essential > /dev/null 2>&1
sudo apt-get install -qq software-properties-common > /dev/null 2>&1
sudo apt-get install -qq python-software-properties > /dev/null 2>&1
sudo apt-get install -qq vim > /dev/null 2>&1
sudo apt-get install -qq curl > /dev/null 2>&1
sudo apt-get install -qq git > /dev/null 2>&1
echo "... done."

# Installing NodeJs
echo "Installing NodeJS..."
sudo add-apt-repository ppa:chris-lea/node.js &> /dev/null
sudo apt-get update &> /dev/null
sudo apt-get install -qq nodejs &> /dev/null
echo "... done."

# Installing and setting up Npm
echo "Installing NPM..."
sudo curl -s -L https://www.npmjs.com/install.sh | sh > /dev/null 2>&1
sudo npm config set registry http://registry.npmjs.org/ &> /dev/null
echo "... done."

# Enable swap memory
echo "Enable swap memory..."
sudo dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo mkswap /var/swap.1
sudo swapon /var/swap.1
echo "... done."