#!/usr/bin/env bash
source const.sh

#Run on host
#Run installNodes on each node

# Import project-wide constants
source const.sh

port=3022
for ((i=0; i<NUMBER_OF_NODES; i++));
do
	echo $'\n ===>Connecting to port '$port'<=== \n'
	# For this to run correctly, we needed to change sudoers beforehand so
	# that sudo'ing as admin doesn't require a password
	# TODO: find a better solution
	cat installNodes.sh | ssh -p $port admin@localhost
	((port++))
done
