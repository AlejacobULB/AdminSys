# Run on host
# Run installAdmin.sh on AdminNode

CEPH_USERNAME=cephUser
ADMIN_PORT=3022

cat installAdmin.sh | ssh -p $ADMIN_PORT $CEPH_USERNAME@127.0.0.1
