# Run on host
# Run createNodes.sh on AdminNode

CEPH_USERNAME=cephUser
ADMIN_PORT=3022

cat createCluster.sh | ssh -p $ADMIN_PORT $CEPH_USERNAME@localhost
