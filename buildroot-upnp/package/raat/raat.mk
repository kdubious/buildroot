################################################################################
#
# RAAT
#
################################################################################

RAAT_VERSION = v1.2
#RAAT_SOURCE = raat-master.tar.gz
RAAT_SITE = https://github.com/kdubious/raat
RAAT_SITE_METHOD = git
RAAT_LICENSE = 
RAAT_LICENSE_FILES = COPYING
RAAT_INSTALL_STAGING = YES
#RAAT_CONFIG_SCRIPTS = RAAT-config
#RAAT_DEPENDENCIES = dl libpthread-stubs

define RAAT_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) TARGET=linux-mp-buildroot CONFIG=release LD=$(TARGET_CC) all
endef

#define RAAT_INSTALL_STAGING_CMDS
#    $(INSTALL) -D -m 0755 $(@D)/RAAT.a $(STAGING_DIR)/usr/lib/RAAT.a
#    $(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
#    $(INSTALL) -D -m 0755 $(@D)/RAAT.so* $(STAGING_DIR)/usr/lib
#endef

define RAAT_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/roon
    $(INSTALL) -D -m 0755 $(@D)/bin/release/linux/armv7hf/raat_app $(TARGET_DIR)/opt/roon/raat_app
endef

#define RAAT_USERS
#    foo -1 RAAT -1 * - - - RAAT daemon
#endef

#define RAAT_DEVICES
#    /dev/foo  c  666  0  0  42  0  -  -  -
#endef

#define RAAT_PERMISSIONS
#    /bin/foo  f  4755  foo  RAAT   -  -  -  -  -
#endef

$(eval $(generic-package))