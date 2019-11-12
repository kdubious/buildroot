#!/bin/sh

if [ "$1" == "" ]; then
        exit 1
fi

mounted=$(mount | grep $1 | wc -l)

# mounted, assume we umount
if [ $mounted -ge 1 ]; then
        if ! umount "/dev/$1"; then
                exit 1
        fi

        if ! rmdir "/mnt/MPD/USB/$1"; then
                exit 1
        fi
# not mounted, lets mount under /mnt/MPD/USB
else
        if ! mkdir -p "/mnt/MPD/USB/$1"; then
                exit 1
        fi

        if ! mount -o sync "/dev/$1" "/mnt/MPD/USB/$1"; then
                # failed to mount, clean up mountpoint
                if ! rmdir "/mnt/MPD/USB/$1"; then
                        exit 1
                fi
                exit 1
        fi
fi

exit 0