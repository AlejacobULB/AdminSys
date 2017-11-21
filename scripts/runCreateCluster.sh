#!/usr/bin/env bash
# Run on host
# Run createNodes.sh on AdminNode

CEPH_USERNAME=cephUser
ADMIN_PORT=3022

ssh -p $ADMIN_PORT $CEPH_USERNAME@localhost 'bash -s' < createCluster.sh
