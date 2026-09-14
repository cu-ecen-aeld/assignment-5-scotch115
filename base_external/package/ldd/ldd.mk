
##############################################################
#                                                          #
# LDD                                                      #
#                                                          #
##############################################################

# TODO: Update with assignment 7 git repo hash
LDD_VERSION = '5c3cae6ddc96b8645dfa6f6bc4ddbba08aae8789'
LDD_SITE = 'git@github.com:scotch115/aeld-assignment-7.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# TODO: Update build comments
define LDD_BUILD_CMDS
	# $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules modules
endef

# TODO Update install commands below to align with what is needed to install LDD
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/* $(TARGET_DIR)/etc/misc_modules
	$(INSTALL) -m 0755 $(@D)/* $(TARGET_DIR)/etc/misc_modules
endef
$(eval $(generic-package))
