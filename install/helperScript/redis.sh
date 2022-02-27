#! /bin/bash

# install redis
sudo apt-get install -y redis-server

# Enable Unix Domain Sockets
sudo sed -i 's@# unixsocket /var/run/redis/redis.sock@unixsocket /var/run/redis/redis.sock@g' /etc/redis/redis.conf
sudo sed -i 's@# unixsocketperm 755@unixsocketperm 775@g' /etc/redis/redis.conf

sudo usermod -aG redis $USER