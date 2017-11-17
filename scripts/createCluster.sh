

mkdir -p my-cluster
cd my-cluster

#Add monitor on nodes
ceph-deploy new node1 node2 node3

#Install Ceph packages on nodes
ceph-deploy install node1 node2 node3

#Deploy the initial monitor(s) and gather the keys (pas trop compris ce que ca fait)
ceph-deploy mon create-initial

#Copy the configuration file and admin key to your admin node and your Ceph Nodes
ceph-deploy admin node1 node2 node3

#DONE CREATE /DEV/VDB ON ALL NODES
#Add OSD's on nodes
ceph-deploy osd create node1:vdb node2:vdb node3:vdb

#Check the node's health
ssh node1 sudo ceph -s
ssh node2 sudo ceph -s
ssh node3 sudo ceph -s
