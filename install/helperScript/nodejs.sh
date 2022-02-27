#! /bin/bash

#
# Install NVM
#
curl -o-  https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR=$HOME/.nvm
. "$NVM_DIR/nvm.sh"

. ~/.bashrc

VERSION=16.14.0
nvm install $VERSION
nvm use $VERSION
nvm alias default $VERSION

# print the version of node and npm
node -v
npm -v

#
# Install utilities
#
npm install -g bunyan
npm install -g pm2
pm2 update
pm2 install pm2-logrotate
pm2 set pm2-logrotate:retain 20
pm2 set pm2-logrotate:max_size 250M