# LEAVE THIS for now, trying to deal with running Roon and MPD
rm -f $TARGET_DIR/etc/init.d/S21haveged
UUID=$TARGET_DIR/opt/mp/uuid
echo UUID
echo `uuid -v4` > $UUID
CONFIG=`jq --arg val $(cat $UUID) '.deviceID=$val' $TARGET_DIR/opt/mp/config.json`;
echo "" > $TARGET_DIR/opt/mp/config.json
echo $CONFIG > $TARGET_DIR/opt/mp/config.json

echo "[TAR] pre tar the /opt folder"
tar -chf $TARGET_DIR/data.tar -C $TARGET_DIR/opt .
echo "[TAR] tar complete"

mv $TARGET_DIR/data.tar $TARGET_DIR/../images/data.tar
rm -r $TARGET_DIR/opt
mkdir $TARGET_DIR/opt

grep -q '^/dev/mmcblk1p3' $TARGET_DIR/etc/fstab && sed -i 's|^/dev/mmcblk1p3.*|/dev/mmcblk1p3    /opt    ext4    defaults    0   0|' $TARGET_DIR/etc/fstab || echo '/dev/mmcblk1p3    /opt    ext4    defaults    0   0' >> $TARGET_DIR/etc/fstab
grep -q '^sd\[a-z\]\[0-9\]' $TARGET_DIR/etc/mdev.conf && sed -i 's|^sd\[a-z\]\[0-9\].*|sd[a-z][0-9]* 0:0 0660 *(/sbin/automount.sh $MDEV)|' $TARGET_DIR/etc/mdev.conf || echo 'sd[a-z][0-9]* 0:0 0660 *(/sbin/automount.sh $MDEV)' >> $TARGET_DIR/etc/mdev.conf
