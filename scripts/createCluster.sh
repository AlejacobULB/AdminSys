#!/usr/bin/bash

# Purpose: Setup Ceph, create the OSDs and configure all the initial nodes of the cluster

NUMBER_OF_OSD_NODES=3

# Create the folder with all the ceph-deploy configuration files
mkdir -p my-cluster
cd my-cluster

# Creates 2 strings: one with all the nodes, and one with all the nodes with their disk devices
nodes=""
nodesSDB=""
for ((i=1; i<=NUMBER_OF_OSD_NODES; i++));
do
  nodes="$nodes node$i"
  nodesSDB="$nodesSDB node$i:sdb"
done

echo "\nWe will setup the cluster on the following OSD nodes: $nodes\n"

echo "\nAdd monitor on nodes\n"
#ceph-deploy new node1 node2 node3
ceph-deploy new $nodes

echo "\nInstall Ceph packages on nodes\n"
ceph-deploy install $nodes

echo "\nDeploy the initial monitor(s) and gather the keys (pas trop compris ce que ca fait)\n"
# Also creates a new configuration file and secret key
ceph-deploy --overwrite-conf mon create-initial

echo "\nCopy the configuration file and admin key to your admin node and your Ceph Nodes\n"
ceph-deploy admin $nodes

echo "\nAdd OSD's on nodes\n"
#ceph-deploy osd create node1:sdb node2:sdb node3:sdb
ceph-deploy osd create $nodesSDB

echo "\nCheck the node's health\n"
for ((i=1; i<=NUMBER_OF_OSD_NODES; i++));
do
  ssh node$i sudo ceph -s
done

echo "\nMake cephUser the new owner of the keyring file, so that it can execute rados commands\n"
for ((i=1; i<=NUMBER_OF_OSD_NODES; i++));
do
  ssh node$i sudo chown cephUser:cephUser /etc/ceph/ceph.client.admin.keyring
done
