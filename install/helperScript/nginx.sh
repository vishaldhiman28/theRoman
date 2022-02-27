#! /bin/bash

# install redis
sudo apt-get install -y nginx

# Enable auto-start at boot time
sudo systemctl enable nginx