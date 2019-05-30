################################################################################
#
# RAAT
#
################################################################################

RAAT_VERSION = v1.4
RAAT_SITE = https://github.com/kdubious/raat
RAAT_SITE_METHOD = git
RAAT_LICENSE = 
RAAT_LICENSE_FILES = COPYING
RAAT_INSTALL_STAGING = YES
RAAT_MAKE_OPTS = \
	TARGET=linux-mp-buildroot \
	CONFIG=release \
	HAVE_ALSA=1 \
	LD=$(TARGET_CC)
RAAT_DEPENDENCIES = alsa-lib
TARGET_CFLAGS += -DPLATFORM_LINUX -DARCH_ARM -DHAVE_ALSA -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fPIC -DARM_FPU_VFP_HARD

define RAAT_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(RAAT_MAKE_OPTS) -C $(@D)  all
endef

define RAAT_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/roon
    $(INSTALL) -D -m 0755 $(@D)/bin/release/linux/armv7hf/raat_app $(TARGET_DIR)/opt/roon/raat_app
endef

$(eval $(generic-package))