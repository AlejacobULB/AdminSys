#!/usr/bin/env bash
source const.sh

# Run on host
# Run installAdmin.sh on AdminNode

<<<<<<< HEAD
# Import project-wide constants
source const.sh

=======
>>>>>>> 3090373a38c06edd8b0eefb289334669bda915d8
cat installAdmin.sh | ssh -p $ADMIN_PORT $CEPH_USERNAME@127.0.0.1
