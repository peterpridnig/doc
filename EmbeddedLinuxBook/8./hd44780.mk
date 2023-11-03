#############################################################
#
# hd44780 - simple display driver
#
#############################################################

HD44780_VERSION = 20131231
HD44780_SITE_METHOD = local
#HD44780_SITE = ../../application/hd44780-$(HD44780_VERSION)
HD44780_SITE = ../../driver/hd44780

HD44780_DEPENDENCIES = linux

define HD44780_BUILD_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
endef

define HD44780_INSTALL_TARGET_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
endef

define HD44780_CLEAN_CMDS
	$(MAKE) -C $(@D) clean
endef

define HD44780_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/hd44780
endef

$(eval $(generic-package))
