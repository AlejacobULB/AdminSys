#!/usr/bin/env bash
# Run on host
# Purpose: executes the installAdmin.sh script on the admin node

CEPH_USERNAME=cephUser
ADMIN_PORT=3022

ssh -p $ADMIN_PORT $CEPH_USERNAME@127.0.0.1 'bash -s' < installAdmin.sh
