define Build/tplink-fw
	mktplinkfw2 -c -B $(BOARD_ID) -s \
		-k $@ -o $@.new
	mv $@.new $@
endef

define Build/mktplinkfw2
	mktplinkfw2 -B $(BOARD_ID) -s -a 0x4 -j \
		-k $(word 1,$^) -r $(word 2,$^) \
		-o $@
endef
DEVICE_VARS += BOARD_ID

define Device/lantiqTpLink
  KERNEL := kernel-bin | append-dtb | lzma
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | tplink-fw
  IMAGES := sysupgrade.bin
  IMAGE/sysupgrade.bin := mktplinkfw2 | check-size $$$$(IMAGE_SIZE)
endef

define Device/TDW8970
  $(Device/lantiqTpLink)
  DEVICE_PROFILE := TDW8970
  DEVICE_DTS = $(DEVICE_PROFILE)
  BOARD_ID := TD-W8970v1
  IMAGE_SIZE := 7680k
endef

define Device/TDW8980
  $(Device/lantiqTpLink)
  DEVICE_PROFILE := TDW8980
  DEVICE_DTS = $(DEVICE_PROFILE)
  BOARD_ID := TD-W8980v1
  IMAGE_SIZE := 7680k
endef

define Device/VR200v
  $(Device/lantiqTpLink)
  DEVICE_PROFILE := VR200v
  DEVICE_DTS = $(DEVICE_PROFILE)
  BOARD_ID := ArcherVR200V
  IMAGE_SIZE := 15808k
endef
TARGET_DEVICES += TDW8970 TDW8980 VR200v

