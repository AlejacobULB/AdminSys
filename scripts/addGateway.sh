#!/usr/bin/env bash
# Purpose : Add a gateway to the cluster on this node
# Run on admin-node inside the my-cluster directory

if [[ $# -eq 0 ]] ; then
    echo 'Too few parameters. You must pass the node name'
    echo 'Example: ./addGateway.sh node8'
    exit 0
fi

gw_node=$1
ceph-deploy rgw create $1
