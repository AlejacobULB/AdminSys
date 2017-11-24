**How to configure a new node for the cluster**

1. Add a network interface :

  auto enp0s8
  
  iface enp0s8 inet static
  
  adress 10.0.0.X
  
  netmask 255.255.255.0

2. Add this line to the hosts file on the admin nodes :

  nodeX 10.0.0.X

3. Modify the hostname file with :

  nodeX


**How to add a new node to the cluster**

1. Run the *installNodes.sh* script in the new node, to setup the *ceph* user and install some packages.

2. Run the *addNode.sh* script from the admin, which:
    1. Sets up SSH between the new node and the admin
    2. Install ceph on the node
    3. Adds a new OSD to the cluster
    4. Check that it worked by checking the node's health
