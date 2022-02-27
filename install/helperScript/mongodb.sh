#! /bin/bash

# install mongodb
sudo apt-get install -y mongodb

# Enable auto-start at boot time
sudo systemctl enable mongodb