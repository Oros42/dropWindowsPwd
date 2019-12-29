#!/bin/bash
# Author : Oros
# 2019-12-23
# https://github.com/Oros42/dropWindowsPwd
#
# This script remove all Windows accound's passord it found.
#
# You need :
# sudo apt install mount ntfs-3g chntpw coreutils gawk

tmpMount="/media/tmpMount"
mkdir -p $tmpMount
for p in ls /dev/disk/by-partuuid/*; do
	# for all partitions
	if [ "$(blkid $p |grep 'TYPE=\"ntfs\"')" != "" ]; then
		# Only NTFS patitions
		ntfsfix $p
		echo "mount -t ntfs-3g $p $tmpMount"
		mount -t ntfs-3g $p $tmpMount
		if [ -f $tmpMount/Windows/System32/config/SAM ]; then
			cp $tmpMount/Windows/System32/config/SAM $tmpMount/Windows/System32/config/SAM.back_$(date +%s)
		fi

		# List of accounts
		chntpw -l $tmpMount/Windows/System32/config/SAM

		for rid in $(chntpw -l $tmpMount/Windows/System32/config/SAM|tail -n +8|awk -F" " '{print $2}' ); do
			# for all user
			echo "RID :$rid"
			# 2 : Unlock and enable user account
			# 1 : Clear (blank) user password
			echo -e "2\n1\nq\ny\n" | chntpw -u 0x$rid $tmpMount/Windows/System32/config/SAM
		done

		# List of accounts after changes
		chntpw -l $tmpMount/Windows/System32/config/SAM

		umount $tmpMount
	fi
done
