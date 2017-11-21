#!/usr/bin/env bash

#! DO NOT RUN ON YOUR PC !
#Run on node

# Purpose: Add cephUser on a node

# Import project-wide constants
source /tmp/const.sh

# Create user
echo $'\n ===>Creating Ceph user<=== \n'
sudo useradd -d /home/$CEPH_USERNAME -m $CEPH_USERNAME
echo "$CEPH_USERNAME:$PASSWORD" | sudo /usr/sbin/chpasswd

echo $'\n ==>Adding sudo privileges to newly created user<=== \n'
# Add sudo privileges to newly created user
echo "$CEPH_USERNAME ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$CEPH_USERNAME
sudo chmod 0440 /etc/sudoers.d/$CEPH_USERNAME
