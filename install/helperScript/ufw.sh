#! /bin/bash

# install FW
sudo apt-get install -y ufw

# Set rules
sudo ufw default deny incoming
sudo ufw allow in on docker0
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https

# Enable auto-start at boot time
sudo ufw --force enable
sudo systemctl enable ufw