#!/usr/bin/env bash
NUMBER_OF_NODES=4
NUMBER_OF_OSD_NODES=3
CEPH_USERNAME=cephUser
PASSWORD=ceph
ADMIN_PORT=3022

# Run on host
# Run createNodes.sh on AdminNode

# Import project-wide constants

ssh -p $ADMIN_PORT $CEPH_USERNAME@localhost 'bash -s' < createCluster.sh
