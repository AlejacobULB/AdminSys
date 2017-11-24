**How to add a new node to the cluster**

1. Run the *installNodes.sh* script in the new node, to setup the *ceph* user and install some packages.

2. Run the *addNode.sh* script from the admin, which:
    1. Sets up SSH between the new node and the admin
    2. Install ceph on the node
    3. Adds a new OSD to the cluster
    4. Check that it worked by checking the node's health


