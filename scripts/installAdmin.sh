#!/usr/bin/env bash
source const.sh

#! DO NOT RUN ON YOUR PC!
# Run on AdminNode
# Install ceph-deploy and send ssh key to other nodes


echo $'\n ===>Setting up APT<=== \n'
sudo apt install apt-transport-https

# Install ceph-deploy
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian-luminous/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list

echo $'\n ===>apt-update<=== \n'
sudo apt update

echo $'\n ===>installing sshpass<=== \n'
sudo apt install sshpass

echo $'\n ===>Installing ceph-deploy<=== \n'
sudo apt install ceph-deploy -y

# Create SSH keys and copy them to the nodes
echo "Create SSH keys and copy them to the nodes"
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
for ((i=0; i<NUMBER_OF_NODES; i++));
do
  sshpass -p ceph ssh-copy-id $CEPH_USERNAME@node$i
done

# Modify the ~/.ssh/config file of your ceph-deploy admin node so that ceph-deploy can
# log in to Ceph nodes as the user you created without requiring you to specify --username {username} each
# time you execute ceph-deploy.
# This has the added benefit of streamlining ssh and scp usage
echo "Modify the ~/.ssh/config file of your ceph-deploy admin node"

for ((i=0; i<NUMBER_OF_NODES; i++));
do
  cat >>~/.ssh/config <<EOL
  Host node$i
     Hostname node$i
     User $CEPH_USERNAME
EOL
done
