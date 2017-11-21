#!/usr/bin/env bash

NUMBER_OF_NODES=4
NUMBER_OF_OSD_NODES=3
CEPH_USERNAME=cephUser
PASSWORD=ceph
ADMIN_PORT=3022

# Run on host
# Run installAdmin.sh on AdminNode

# Import project-wide constants

ssh -p $ADMIN_PORT $CEPH_USERNAME@127.0.0.1 'bash -s' < installAdmin.sh
