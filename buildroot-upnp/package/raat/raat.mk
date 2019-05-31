################################################################################
#
# RAAT
#
################################################################################

RAAT_VERSION = master
RAAT_SITE = https://github.com/RoonLabs/raat.git
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
#TARGET_CFLAGS += -DPLATFORM_LINUX -DARCH_ARM -DHAVE_ALSA -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fPIC -DARM_FPU_VFP_HARD

define RAAT_BUILD_CMDS
	@echo "*** RAAT_MAKE_OPTS" $(RAAT_MAKE_OPTS)
	@echo "*** TARGET_CONFIGURE_OPTS" $(TARGET_CONFIGURE_OPTS)
	@echo "***CFLAGS" $(CFLAGS)

    $(TARGET_CONFIGURE_OPTS) $(MAKE) $(RAAT_MAKE_OPTS) -C $(@D)  all

	@echo "***CFLAGS" $(CFLAGS)

endef

define RAAT_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/roon
    $(INSTALL) -D -m 0755 $(@D)/bin/release/linux/armv7hf/raat_app $(TARGET_DIR)/opt/roon/raat_app
endef

$(eval $(generic-package))