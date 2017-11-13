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
echo "$CEPH_USERNAME:$PASSWORD" | sudo /usr/sbin/chpasswd

echo "Add sudo privileges to newly created user"
# Add sudo privileges to newly created user
echo "$CEPH_USERNAME ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$CEPH_USERNAME
sudo chmod 0440 /etc/sudoers.d/$CEPH_USERNAME


