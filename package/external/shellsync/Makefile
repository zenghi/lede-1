include $(TOPDIR)/rules.mk

PKG_NAME:=shellsync
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/shellsync
  CATEGORY:=Utilities
  TITLE:=shellsync
  DEPENDS:=+libpthread
endef

define Package/shellsync/description
A tool to sync different shell scripts.Based on syncppp patch by morfast.
endef

define Build/Compile
	$(TARGET_CROSS)gcc -pthread -o $(PKG_BUILD_DIR)/shellsync $(PKG_BUILD_DIR)/shellsync.c
endef

define Package/shellsync/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/shellsync $(1)/usr/bin
endef


$(eval $(call BuildPackage,shellsync))
