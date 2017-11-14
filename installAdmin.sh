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

echo $'\n ===>Generating SSH key <=== \n'
ssh-keygen

echo $'\n ===>Copying the SSH key to each Ceph nodes<=== \n'

for i in {1..$NUMBER_OF_NODES}
do

    ssh-copy-id CEPH_USERNAME@node.$i

done

echo "
Host node1
	Hostname node1
	User CephUser
Host node2
	Hostname node2
	User CephUser
Host node3
	Hostname node3
	User CephUser" >> ~/.ssh/config

