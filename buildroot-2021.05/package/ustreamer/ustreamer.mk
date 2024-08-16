################################################################################
#
# ustreamer
#
################################################################################

USTREAMER_VERSION = v6.12
USTREAMER_SITE = $(call github,pikvm,ustreamer,$(USTREAMER_VERSION))
USTREAMER_LICENSE = GPL-3.0-or-later
USTREAMER_LICENSE_FILES = LICENSE

USTREAMER_DEPENDENCIES = jpeg libevent libbsd host-pkgconf

USTREAMER_MAKE_OPTS = WITH_PTHREAD_NP=0

define USTREAMER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		$(USTREAMER_MAKE_OPTS) -C $(@D)
endef

define USTREAMER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 644  $(@D)/src/ustreamer.bin $(TARGET_DIR)/usr/bin/ustreamer
endef

$(eval $(generic-package))
