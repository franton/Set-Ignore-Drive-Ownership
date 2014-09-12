#!/bin/bash

# Script to set non bootable volumes to "ignore ownership"
# Inspired by https://github.com/andrina/JNUC2013/blob/master/Users%20Do%20Your%20Job/IgnoreVolumeOwnership.sh

# Author      : contact@richard-purves.com

# Version 1.0 : 18-10-2012 - Initial Version

# Start by backing up IFS, then setting it to ignore spaces as newline

OIFS=$IFS
IFS='"'

# Get a list of mounted local disks. This will ignore mount point / for obvious reasons

MOUNTS=`df -l | awk '{for (i=1; i<=NF-8; i++) $i = $(i+8); NF-=8; print}' | tail -n +3`

# Loop to go around all the listed drives then set the ignore ownership on

echo $MOUNTS | while read -r VOLUMENAME
do

# Ignore ownership using variable created above

diskutil disableOwnership "$VOLUMENAME"
	
done

# Set IFS back to normal

IFS=$OIFS

# All done!

exit 0
