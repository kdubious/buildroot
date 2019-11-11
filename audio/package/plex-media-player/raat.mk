################################################################################
#
# PLEX-MEDIA-PLAYER
#
################################################################################

PLEX-MEDIA-PLAYER_VERSION = 1b0839a
PLEX-MEDIA-PLAYER_SITE = https://github.com/plexinc/plex-media-player.git
PLEX-MEDIA-PLAYER_SITE_METHOD = git
PLEX-MEDIA-PLAYER_LICENSE = 
PLEX-MEDIA-PLAYER_LICENSE_FILES = COPYING
PLEX-MEDIA-PLAYER_INSTALL_STAGING = YES
PLEX-MEDIA-PLAYER_MAKE_OPTS = 
PLEX-MEDIA-PLAYER_DEPENDENCIES = alsa-lib
#TARGET_CFLAGS += -DPLATFORM_LINUX -DARCH_ARM -DHAVE_ALSA -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fPIC -DARM_FPU_VFP_HARD

define PLEX-MEDIA-PLAYER_BUILD_CMDS
	@echo "*** PLEX-MEDIA-PLAYER_MAKE_OPTS" $(PLEX-MEDIA-PLAYER_MAKE_OPTS)
	@echo "*** TARGET_CONFIGURE_OPTS" $(TARGET_CONFIGURE_OPTS)
	@echo "***CFLAGS" $(CFLAGS)

    $(TARGET_CONFIGURE_OPTS) $(MAKE) $(PLEX-MEDIA-PLAYER_MAKE_OPTS) -C $(@D)  all

	@echo "***CFLAGS" $(CFLAGS)

endef

define PLEX-MEDIA-PLAYER_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/plex
    $(INSTALL) -D -m 0755 $(@D)/bin/release/linux/armv7hf/plexmediaplayer $(TARGET_DIR)/opt/plex/plexmediaplayer
endef

$(eval $(generic-package))