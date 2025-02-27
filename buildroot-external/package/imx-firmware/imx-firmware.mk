################################################################################
#
# imx-firmware
#
################################################################################

IMX_FIRMWARE_VERSION = 2978f3c88d6bcc5695a7b45f1936f18d31eebfa8
IMX_FIRMWARE_SITE = $(call github,nxp-imx,imx-firmware,$(IMX_FIRMWARE_VERSION))
IMX_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
IMX_FIRMWARE_LICENSE_FILES = LICENSE.txt
IMX_FIRMWARE_INSTALL_IMAGES = YES

ifeq ($(BR2_PACKAGE_IMX_FIRMWARE_8801_SD),y)
define IMX_FIRMWARE_INSTALL_8801_SD_FW
	mkdir -p $(TARGET_DIR)/lib/firmware/nxp
	cp -r $(@D)/nxp/FwImage_8801_SD/* $(TARGET_DIR)/lib/firmware/nxp
endef
endif

ifeq ($(BR2_PACKAGE_IMX_FIRMWARE_8987_SD),y)
define IMX_FIRMWARE_INSTALL_8987_SD_FW
	mkdir -p $(TARGET_DIR)/lib/firmware/nxp
	cp -r $(@D)/nxp/FwImage_8987/* $(TARGET_DIR)/lib/firmware/nxp
endef
endif

ifeq ($(BR2_PACKAGE_IMX_FIRMWARE_8997_PCIE),y)
define IMX_FIRMWARE_INSTALL_8997_PCIE_FW
	mkdir -p $(TARGET_DIR)/lib/firmware/nxp
	cp -r $(@D)/nxp/FwImage_8997/* $(TARGET_DIR)/lib/firmware/nxp
endef
endif

ifeq ($(BR2_PACKAGE_IMX_FIRMWARE_8997_SD),y)
define IMX_FIRMWARE_INSTALL_8997_SD_FW
	mkdir -p $(TARGET_DIR)/lib/firmware/nxp
	cp -r $(@D)/nxp/FwImage_8997_SD/* $(TARGET_DIR)/lib/firmware/nxp
endef
endif

ifeq ($(BR2_PACKAGE_IMX_FIRMWARE_9098_PCIE),y)
define IMX_FIRMWARE_INSTALL_9098_PCIE_FW
	mkdir -p $(TARGET_DIR)/lib/firmware/nxp
	cp -r $(@D)/nxp/FwImage_9098_PCIE/* $(TARGET_DIR)/lib/firmware/nxp
endef
endif

ifeq ($(BR2_PACKAGE_IMX_FIRMWARE_9098_SD),y)
define IMX_FIRMWARE_INSTALL_9098_SD_FW
	mkdir -p $(TARGET_DIR)/lib/firmware/nxp
	cp -r $(@D)/nxp/FwImage_9098_SD/* $(TARGET_DIR)/lib/firmware/nxp
endef
endif

ifeq ($(BR2_PACKAGE_IMX_FIRMWARE_IW416_SD),y)
define IMX_FIRMWARE_INSTALL_IW416_SD_FW
	mkdir -p $(TARGET_DIR)/lib/firmware/nxp
	cp -r $(@D)/nxp/FwImage_IW416_SD/* $(TARGET_DIR)/lib/firmware/nxp
endef
endif

ifeq ($(BR2_PACKAGE_IMX_FIRMWARE_IW612_SD),y)
define IMX_FIRMWARE_INSTALL_IW612_SD_FW
	mkdir -p $(TARGET_DIR)/lib/firmware/nxp
	cp -r $(@D)/nxp/FwImage_IW612_SD/* $(TARGET_DIR)/lib/firmware/nxp
endef
endif

ifeq ($(BR2_PACKAGE_IMX_FIRMWARE_CONFIG_FILE),y)
define IMX_FIRMWARE_INSTALL_CONFIG_FILE
	mkdir -p $(TARGET_DIR)/lib/firmware/nxp
	$(INSTALL) -D -m 0644 $(@D)/nxp/wifi_mod_para.conf $(TARGET_DIR)/lib/firmware/nxp
endef
endif

define IMX_FIRMWARE_INSTALL_IMAGES_CMDS
	$(IMX_FIRMWARE_INSTALL_8801_SD_FW)
	$(IMX_FIRMWARE_INSTALL_8987_SD_FW)
	$(IMX_FIRMWARE_INSTALL_8997_PCIE_FW)
	$(IMX_FIRMWARE_INSTALL_8997_SD_FW)
	$(IMX_FIRMWARE_INSTALL_9098_PCIE_FW)
	$(IMX_FIRMWARE_INSTALL_9098_SD_FW)
	$(IMX_FIRMWARE_INSTALL_IW416_SD_FW)
	$(IMX_FIRMWARE_INSTALL_IW612_SD_FW)
	$(IMX_FIRMWARE_INSTALL_CONFIG_FILE)
endef

$(eval $(generic-package))
