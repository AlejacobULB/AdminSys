# Run on AdminNode
# Install ceph-deploy and send ssh key to other nodes

NUMBER_OF_NODES=3
CEPH_USERNAME=CephUser

echo $'\n ===>Setting up APT<=== \n'
sudo apt install apt-transport-https

# Install ceph-deploy
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-luminous/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list

echo $'\n ===>apt-update<=== \n'
sudo apt update

echo $'\n ===>Installing ceph-deploy<=== \n'
sudo apt install ceph-deploy -y

# Create SSH keys and copy them to the nodes
echo "Create SSH keys and copy them to the nodes"
cat /dev/zero | ssh-keygen -q -N ""
ssh-copy-id $CEPH_USERNAME@node1
ssh-copy-id $CEPH_USERNAME@node2
ssh-copy-id $CEPH_USERNAME@node3

# Modify the ~/.ssh/config file of your ceph-deploy admin node so that ceph-deploy can 
# log in to Ceph nodes as the user you created without requiring you to specify --username {username} each 
# time you execute ceph-deploy. 
# This has the added benefit of streamlining ssh and scp usage
echo "Modify the ~/.ssh/config file of your ceph-deploy admin node"
cat >>~/.ssh/config <<EOL
Host node1
   Hostname node1
   User $CEPH_USERNAME
Host node2
   Hostname node2
   User $CEPH_USERNAME
Host node3
   Hostname node3
   User $CEPH_USERNAME
EOL