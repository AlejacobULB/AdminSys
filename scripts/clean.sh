#!/usr/bin/env bash
#
# Purpose: use this script to start over the storage cluster installation. 
# It purges the Ceph packages, and erases all its data and configuration.


cd my-cluster
ceph-deploy purge node1 node2 node3
ceph-deploy purgedata node1 node2 node3
ceph-deploy forgetkeys

# Removes any files that were written out by ceph-deploy locally during a previous installation.
rm ceph.*