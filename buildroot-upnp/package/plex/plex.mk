################################################################################
#
# PLEX
#
################################################################################

PLEX_VERSION = b1b1148
PLEX_SITE = https://github.com/RoonLabs/raat.git
PLEX_SITE_METHOD = git
PLEX_LICENSE = 
PLEX_LICENSE_FILES = COPYING
PLEX_INSTALL_STAGING = YES
PLEX_MAKE_OPTS = \
	TARGET=linux-mp-buildroot \
	CONFIG=release \
	HAVE_ALSA=1 \
	LD=$(TARGET_CC)
PLEX_DEPENDENCIES = alsa-lib
#TARGET_CFLAGS += -DPLATFORM_LINUX -DARCH_ARM -DHAVE_ALSA -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fPIC -DARM_FPU_VFP_HARD

define PLEX_BUILD_CMDS
	@echo "*** PLEX_MAKE_OPTS" $(PLEX_MAKE_OPTS)
	@echo "*** TARGET_CONFIGURE_OPTS" $(TARGET_CONFIGURE_OPTS)
	@echo "***CFLAGS" $(CFLAGS)

    $(TARGET_CONFIGURE_OPTS) $(MAKE) $(PLEX_MAKE_OPTS) -C $(@D)  all

	@echo "***CFLAGS" $(CFLAGS)

endef

define PLEX_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/roon
    $(INSTALL) -D -m 0755 $(@D)/bin/release/linux/armv7hf/raat_app $(TARGET_DIR)/opt/roon/raat_app
endef

$(eval $(generic-package))