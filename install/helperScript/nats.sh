#! /bin/bash


TEMPDIR=/tmp/nats-$$
mkdir -p $TEMPDIR
cd $TEMPDIR

VERSION=v0.24.2
wget https://github.com/nats-io/nats-streaming-server/releases/download/$VERSION/nats-streaming-server-$VERSION-linux-amd64.zip
unzip -o nats-streaming-server-$VERSION-linux-amd64.zip
sudo mv nats-streaming-server-$VERSION-linux-amd64/nats-streaming-server-$VERSION /usr/local/antares/bin

# Install Nats server
wget https://github.com/nats-io/nats-server/releases/download/v2.7.3/nats-server-v2.7.3-linux-amd64.zip
unzip -o nats-server-v2.7.3-linux-amd64.zip
sudo mv nats-server-v2.7.3-linux-amd64/nats-server /usr/local/roman/bin


#
# Create a generic symbolic link
#
cd /usr/local/roman/bin
sudo ln -sf nats-streaming-server-$VERSION nats-streaming-server