# LEAVE THIS for now, trying to deal with running Roon and MPD
rm -f $TARGET_DIR/etc/init.d/S21haveged
UUID=$TARGET_DIR/opt/mp/uuid
echo UUID
echo `uuid -v4` > $UUID
CONFIG=`jq --arg val $(cat $UUID) '.deviceID=$val' $TARGET_DIR/opt/mp/config.json`;
echo "" > $TARGET_DIR/opt/mp/config.json
echo $CONFIG > $TARGET_DIR/opt/mp/config.json