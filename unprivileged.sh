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

# fixing NPM long paths in windows hosts installing npm@3.x that flattens all dependencies
npm install -g npm@3.0-latest
echo "... done."

# clearing the cache solves some tar.unpack problems... (details: https://github.com/npm/npm/issues/5133)
echo "Clearing NPM cache..."
npm cache clean
echo "... done."

# customizing the bash shell
echo "Customizing shell..."
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --none
mkdir ~/.bash_it/aliases/enabled
mkdir ~/.bash_it/plugins/enabled
ln -s ~/.bash_it/aliases/available/general.aliases.bash ~/.bash_it/aliases/enabled/general.aliases.bash
ln -s ~/.bash_it/aliases/available/git.aliases.bash ~/.bash_it/aliases/enabled/git.aliases.bash
ln -s ~/.bash_it/aliases/available/laravel.aliases.bash ~/.bash_it/aliases/enabled/laravel.aliases.bash
ln -s ~/.bash_it/aliases/available/vim.aliases.bash ~/.bash_it/aliases/enabled/vim.aliases.bash
ln -s ~/.bash_it/plugins/available/base.plugin.bash ~/.bash_it/plugins/enabled/base.plugin.bash
ln -s ~/.bash_it/plugins/available/dirs.plugin.bash ~/.bash_it/plugins/enabled/dirs.plugin.bash
ln -s ~/.bash_it/plugins/available/git.plugin.bash ~/.bash_it/plugins/enabled/git.plugin.bash
ln -s ~/.bash_it/plugins/available/history.plugin.bash ~/.bash_it/plugins/enabled/history.plugin.bash
ln -s ~/.bash_it/plugins/available/ssh.plugin.bash ~/.bash_it/plugins/enabled/ssh.plugin.bash
sed -i "s/export BASH_IT_THEME='bobby'/export BASH_IT_THEME='bakke'/" ~/.bashrc
touch ~/.bash_profile
cat <<EOT >> ~/.bash_profile
if [ -f ~/.profile ]; then
   source ~/.profile
fi
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
EOT
echo "... done."