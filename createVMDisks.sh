#!/usr/bin/env bash

BASEPATH="~/VirtualBox VMs"
DISKNAME="osd-disk.vdi"
DISKSIZE=100000 # 100 000 MB = 100GB

# Recreate disk for vm1
VBoxManage closemedium disk "$BASEPATH/node1/$DISKNAME" --delete
VBoxManage createvdi --filename "$BASEPATH/node1/$DISKNAME" --size $DISKSIZE

# Recreate disk for vm2
VBoxManage closemedium disk "$BASEPATH/node2/$DISKNAME" --delete
VBoxManage createvdi --filename "$BASEPATH/node2/$DISKNAME" --size $DISKSIZE


# Recreate disk for vm3
VBoxManage closemedium disk "$BASEPATH/node3/$DISKNAME" --delete
VBoxManage createvdi --filename "$BASEPATH/node3/$DISKNAME" --size $DISKSIZE
