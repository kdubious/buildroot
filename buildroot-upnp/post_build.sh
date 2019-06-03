# LEAVE THIS for now, trying to deal with running Roon and MPD
rm -f $TARGET_DIR/etc/init.d/S95mpd
rm -f $TARGET_DIR/etc/init.d/S21haveged

echo `uuid -v4` > /opt/mp/uuid
CONFIG = `jq --arg val $(cat uuid) '.deviceID=$val' $TARGET_DIR/opt/mp/config.json`;
echo "" > $TARGET_DIR/opt/mp/config.json
echo $CONFIG > $TARGET_DIR/opt/mp/config.json