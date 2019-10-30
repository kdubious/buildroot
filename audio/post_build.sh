# LEAVE THIS for now, trying to deal with running Roon and MPD
rm -f $TARGET_DIR/etc/init.d/S21haveged
UUID=$TARGET_DIR/opt/mp/uuid
echo UUID
echo `uuid -v4` > $UUID
CONFIG=`jq --arg val $(cat $UUID) '.deviceID=$val' $TARGET_DIR/opt/mp/config.json`;
echo "" > $TARGET_DIR/opt/mp/config.json
echo $CONFIG > $TARGET_DIR/opt/mp/config.json

echo "pre tar the /opt folder"
read -p "Press [Enter] key to continue..."
tar -chJf $TARGET_DIR/data.tar.xz -C $TARGET_DIR/opt .
read -p "Press [Enter] key to continue..."
mv $TARGET_DIR/data.tar.xz $TARGET_DIR/../images/data.tar.xz
read -p "Press [Enter] key to continue..."

echo "pre kill $TARGET_DIR/opt"
rm -r $TARGET_DIR/opt
read -p "Press [Enter] key to continue..."

echo "pre make new /opt folder"
mkdir $TARGET_DIR/opt
read -p "Press [Enter] key to continue..."


echo '/dev/mmcblk1p3    /opt    ext4    defaults    0   0' >> $TARGET_DIR/etc/fstab