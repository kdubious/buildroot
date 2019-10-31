#rm $1/rootfs.tar
#cp $1/* /mnt/d/toradex/buildroot/
IMAGEDIR=$1
echo $IMAGEDIR
echo "[TAR] pre tar the bootfs.tar.xz file"
tar -chJf $IMAGEDIR/bootfs.tar.xz -C $IMAGEDIR zImage imx7d-colibri-emmc-eval-v3.dtb
echo "[TAR] tar complete"