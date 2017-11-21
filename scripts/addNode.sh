#!/usr/bin/env bash

# Purpose: Run this script on the admin to add a new node to the cluster

# Import project-wide constants
source const.sh

# Script parameters
nodeName=$1
diskDevice=${2:-sdb} # The default name of the disk device is sdb



##########################
#       Setup SSH        #
##########################

echo "Copy the SSH key to the new node to enable password-less SSH"
sshpass -p ceph ssh-copy-id $CEPH_USERNAME@$nodeName

echo "Add the new node information to the ~/.ssh/config for easy SSH'ing"
cat >>~/.ssh/config <<EOL
Host $nodeName
   Hostname $nodeName
   User $CEPH_USERNAME
EOL



##################################
#    Install CEPH and add OSD    #
##################################

# Go to the my-cluster directory (which contains all the configuration files)
cd my-cluster

echo "\nInstall Ceph packages on the new node\n"
ceph-deploy install $nodeName

echo "\nCopy the configuration file and admin key to the new node\n"
# Prepares a host with a ceph.conf and ceph.client.admin.keyring keyring file
# which enables it to execute ceph commands with administrator privileges
ceph-deploy admin $nodeName

echo "\nAdd OSD's on nodes\n"
ceph-deploy osd create $nodeName:$diskDevice

echo "\nCheck the new node's health\n"
ssh $nodeName sudo ceph -s

echo "\nMake cephUser the new owner of the keyring file, so that it can execute rados commands\n"
ssh $nodeName sudo chown cephUser:cephUser /etc/ceph/ceph.client.admin.keyring