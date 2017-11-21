#!/usr/bin/env bash
source const.sh

# Run on host
# Run createNodes.sh on AdminNode

# Import project-wide constants
source const.sh

cat createCluster.sh | ssh -p $ADMIN_PORT $CEPH_USERNAME@localhost
