# Create SSH keys and copy them to the nodes
echo "Create SSH keys and copy them to the nodes"
cat /dev/zero | ssh-keygen -q -N ""
ssh-copy-id $SERVER_USERNAME@server2
ssh-copy-id $SERVER_USERNAME@server3
ssh-copy-id $SERVER_USERNAME@server4

# Modify the ~/.ssh/config file of your ceph-deploy admin node so that ceph-deploy can 
# log in to Ceph nodes as the user you created without requiring you to specify --username {username} each 
# time you execute ceph-deploy. 
# This has the added benefit of streamlining ssh and scp usage
echo "Modify the ~/.ssh/config file of your ceph-deploy admin node"
cat >>~/.ssh/config <<EOL
Host server2
   Hostname server2
   User $CEPH_USERNAME
Host server3
   Hostname server3
   User $CEPH_USERNAME
Host server4
   Hostname server4
   User $CEPH_USERNAME
EOL
