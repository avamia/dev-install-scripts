#!bin/bash
sudo apt update
sudo apt install nfs-kernel-server -y

sudo sh -c 'echo "/home/ubuntu 172.16.50.0/24(rw,sync,all_squash,no_subtree_check,insecure,anonuid=1000,anongid=1000)" >> /etc/exports'
sudo sed -i 's/^RPCMOUNTDOPTS=.*/RPCMOUNTDOPTS="--port 33333"/' /etc/default/nfs-kernel-server

sudo exportfs -a
sudo systemctl restart nfs-kernel-server
