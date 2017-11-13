SERVER=$1
SERVER_USERNAME=admin
USERNAME=cephUser
PASSWORD=ceph

# Install ceph-deploy
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-luminous/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
sudo apt update
sudo apt install ceph-deploy

# Install NTP (to avoid clock skew)
# sudo apt install ntp


# Install SSH server
sudo apt install openssh-server

# Create user
ssh $SERVER_USERNAME@$SERVER
sudo useradd -d /home/$USERNAME -m $USERNAME
echo "$PASSWORD" | passwd "$USERNAME" --stdin

# Add sudo privileges to newly created user
echo "$USERNAME ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USERNAME
sudo chmod 0440 /etc/sudoers.d/$USERNAME
