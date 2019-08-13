################################################################################
#
# MPCODEC
#
################################################################################

MPCODEC_LICENSE = GPL-2.0
MPCODEC_FILES = \
    Makefile \
    mp.c \
    mp_clkgen.h \
    mp.h
# ~/linux/sound/soc/codecs/mp.c \
# ~/linux/sound/soc/codecs/mp_clkgen.h \
# ~/linux/sound/soc/codecs/mp.h \

define MPCODEC_EXTRACT_CMDS
        cd $(BR2_EXTERNAL_MP_AUDIO_PATH)/package/mpcodec ; cp $(MPCODEC_FILES) $(@D)/
endef

$(eval $(kernel-module))
$(eval $(generic-package))