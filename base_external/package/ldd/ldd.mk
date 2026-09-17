
##############################################################
#                                                          #
# LDD                                                      #
#                                                          #
##############################################################

# TODO: Update with assignment 7 git repo hash
LDD_VERSION = '22fdc0d1aac29cd1980b1cd93706bbfc72049a2f'
LDD_SITE = 'git@github.com:scotch115/aeld-assignment-7.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = misc-modules/
LDD_MODULE_SUBDIRS += scull/
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# TODO: Update build comments
define LDD_BUILD_CMDS
	$(MAKE) -C $(@D)/misc-modules
	$(MAKE) -C $(@D)/scull
	# $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules
	# $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull
endef

# TODO Update install commands below to align with what is needed to install LDD
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/misc-modules/ $(TARGET_DIR)/etc/misc-modules
	$(INSTALL) -d 0755 $(@D)/scull/ $(TARGET_DIR)/etc/scull
	$(INSTALL) -m 0755 $(@D)/load-ldd.sh $(TARGET_DIR)/etc/init.d/S98lddmodules

	$(INSTALL) -m 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/etc/misc-modules
	$(INSTALL) -m 0755 $(@D)/misc-modules/*.o $(TARGET_DIR)/etc/misc-modules
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/etc/misc-modules
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/etc/misc-modules
	
	$(INSTALL) -m 0755 $(@D)/scull/*.ko $(TARGET_DIR)/etc/scull
	$(INSTALL) -m 0755 $(@D)/scull/*.o $(TARGET_DIR)/etc/scull
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/etc/scull
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/etc/scull
endef
$(eval $(kernel-module))
$(eval $(generic-package))
