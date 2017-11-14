#!/bin/bash
echo "Virtual Box DHCP server: shutting down"
VBoxManage dhcpserver remove --netname intnet
echo "Virtual Box DHCP server: starting up"
VBoxManage dhcpserver add --netname intnet --ip 10.0.0.1 --netmask 255.255.255.0 --enable --lowerip 10.0.0.100 --upperip 10.0.0.200 

