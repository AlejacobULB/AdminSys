

mkdir -p my-cluster
cd my-cluster

echo "\nAdd monitor on nodes\n"
ceph-deploy new node1 node2 node3

echo "\nInstall Ceph packages on nodes\n"
ceph-deploy install node1 node2 node3

echo "\nDeploy the initial monitor(s) and gather the keys (pas trop compris ce que ca fait)\n"
ceph-deploy --overwrite-conf mon create-initial 

echo "\nCopy the configuration file and admin key to your admin node and your Ceph Nodes\n"
ceph-deploy admin node1 node2 node3

#Deploy a manager daemon
# ceph-deploy mgr create  node2 node3

#DONE CREATE /DEV/VDB ON ALL
echo "\nAdd OSD's on nodes\n"
ceph-deploy osd create node1:sdb node2:sdb node3:sdb

echo "\nCheck the node's health\n"
ssh node1 sudo ceph -s
ssh node2 sudo ceph -s
ssh node3 sudo ceph -s
