#!/usr/bin/env bash
# Run on host
# Purpose: executes the createCluster.sh script on the admin node

CEPH_USERNAME=cephUser
ADMIN_PORT=3022

ssh -p $ADMIN_PORT $CEPH_USERNAME@localhost 'bash -s' < createCluster.sh
