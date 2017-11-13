SERVER=$1
SERVER_USERNAME=admin
CEPH_USERNAME=cephUser
PASSWORD=ceph

# ssh -p 3022 $SERVER_USERNAME@127.0.0.1

echo "Setting up APT"
sudo apt install apt-transport-https

# Install ceph-deploy
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-luminous/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
echo "apt-update"
sudo apt update
echo "install ceph-deploy"
sudo apt install ceph-deploy -y

# Create user
echo "create user"
sudo useradd -d /home/$CEPH_USERNAME -m $CEPH_USERNAME
echo "$PASSWORD" | passwd "$CEPH_USERNAME" --stdin

echo "Add sudo privileges to newly created user"
# Add sudo privileges to newly created user
echo "$CEPH_USERNAME ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$CEPH_USERNAME
sudo chmod 0440 /etc/sudoers.d/$CEPH_USERNAME

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
