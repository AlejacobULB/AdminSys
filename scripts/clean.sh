cd my-cluster
ceph-deploy purge node1 node2 node3
ceph-deploy purgedata node1 node2 node3
ceph-deploy forgetkeys
rm ceph.*