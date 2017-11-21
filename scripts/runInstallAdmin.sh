#!/usr/bin/env bash
source const.sh

# Run on host
# Run installAdmin.sh on AdminNode

cat installAdmin.sh | ssh -p $ADMIN_PORT $CEPH_USERNAME@127.0.0.1
