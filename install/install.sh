#
# Print all commands
#
function banner {
	echo '########################################################'
	echo '#'
	echo '# Running Task : ' $*
	echo '#'
	echo '########################################################'
}

#
# Fix Locale
#
sudo bash -c 'echo "LC_ALL=en_US.UTF-8" >> /etc/environment'
sudo bash -c 'echo "LANG=en_US.UTF-8" >> /etc/environment'
sudo mkdir -p /usr/local/roman/bin
mkdir -p $HOME/.roman

cat << EOF > $HOME/.roman/path
export PATH=/usr/local/roman/bin:\$PATH
EOF

#
# Source the path file into the .bashrc
#
LINES=`grep '\.[[:space:]]\+\$HOME/\.roman/path' $HOME/.bashrc`
[ -z "$LINES" ] && {
	echo '. $HOME/.roman/path' >> $HOME/.bashrc
}

#
# Initial Preparation
#
sudo apt-get update
sudo apt-get install build-essential unzip g++-4.8 -y
sudo apt-get install unzip -y
sudo apt-get install git -y
sudo apt-get install jq -y
sudo apt-get install python -y

#
# Install nodejs
#
banner "Installing Node JS"
sudo bash ./helperScript/nodejs.sh

#
# Install Avahi for ZeroConf
#
banner "Installing Avahi Daemon"
sudo apt-get install -y avahi-daemon

#
# Install REDIS
#
banner "Installing REDIS"
sudo bash ./helperScript/redis.sh

#
# Install Consul
#
banner "Installing Consul"
sudo bash ./helperScript/consul.sh

#
# Install NATS
#
banner "Installing NATS"
sudo bash ./helperScript/nats.sh

#
# Install NGINX
#
banner "Installing NGINX"
sudo bash ./helperScript/nginx.sh

#
# Install MongoDB
#
banner "Installing MONGODB"
sudo bash ./helperScript/mongodb.sh

#
# Install FIREWALL
#
banner "Installing FIREWALL"
sudo bash ./helperScript/ufw.sh
