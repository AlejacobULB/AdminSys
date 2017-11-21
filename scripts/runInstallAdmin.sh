#!/usr/bin/env bash
# Run on host
# Run installAdmin.sh on AdminNode

# Import project-wide constants
source const.sh

cat installAdmin.sh | ssh -p $ADMIN_PORT $CEPH_USERNAME@127.0.0.1
