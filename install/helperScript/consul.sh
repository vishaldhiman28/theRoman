#!/bin/bash

#
# Actual start of action
#
TEMPDIR=/tmp/consul-$$
mkdir -p $TEMPDIR

# Get it
curl -s https://releases.hashicorp.com/consul/1.11.3+ent/consul_1.11.3+ent_linux_amd64.zip -o $TEMPDIR/consul.zip

cd $TEMPDIR/
unzip -o consul.zip
sudo mv consul /usr/local/roman/bin