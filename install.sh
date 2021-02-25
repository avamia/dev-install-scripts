#!bin/bash

## Install Tools
sudo apt install tree -y

## Install Networking Tools
sudo apt update
sudo apt install net-tools tcpdump nmap whois -y 

## Install and Configure NFS
sudo apt update
sudo apt install nfs-kernel-server -y

sudo sh -c 'echo "/home/ubuntu 172.16.50.0/24(rw,sync,all_squash,no_subtree_check,insecure,anonuid=1000,anongid=1000)" >> /etc/exports'
sudo sed -i 's/^RPCMOUNTDOPTS=.*/RPCMOUNTDOPTS="--port 33333"/' /etc/default/nfs-kernel-server

sudo exportfs -a
sudo systemctl restart nfs-kernel-server

## Install RVM
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby

## Install Gem Package
gem install bundler
gem install rails

## Install Nodejs
sudo apt install nodejs npm -y

## Install Yarn
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

## Install Redis
sudo apt install redis-server -y

## Install Postgres
sudo apt update
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt install libpq-dev postgresql-13 postgresql-client-13 -y

sudo -u postgres createuser -s avamia


