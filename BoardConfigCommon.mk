#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true
BOARD_USES_GENERIC_AUDIO := false

# CPU
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_CPU_VARIANT := cortex-a15
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_EXTRA_CFLAGS := -mtune=cortex-a15 -mcpu=cortex-a15

# Compiler Optimizations
ARCH_ARM_HIGH_OPTIMIZATION := true

# Enable various prefetch optimizations
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

BOARD_VENDOR := huawei
BOARD_VENDOR_PLATFORM := hi3630
TARGET_BOOTLOADER_BOARD_NAME := hi3630
TARGET_BOARD_PLATFORM := hi3630
TARGET_SOC := kirin920

COMMON_GLOBAL_CFLAGS += -DHISILICON_HI3630
#COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Init
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

# Kernel
BOARD_KERNEL_CMDLINE  := 'androidboot.hardware=hi3630 coherent_pool=512K vmalloc=384M mem=2044m@0x200000 psci=enable androidboot.selinux=permissive mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p7(modemnvm_factory),p18(splash),p22(dfx),p23(modemnvm_backup),p24(modemnvm_img),p25(modemnvm_system),p26(modem),p27(modem_dsp),p28(modem_om),p29(modemnvm_update),p31(3rdmodem),p32(3rdmodemnvm),p33(3rdmodemnvmbkp)'

BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_OFFSET   := 0x00608000
BOARD_RAMDISK_OFFSET  := 0x04000000
BOARD_SECOND_OFFSET   := 0x00f00000
BOARD_TAGS_OFFSET     := 0x00200000

BOARD_MKBOOTIMG_ARGS += --kernel_offset "$(BOARD_KERNEL_OFFSET)"
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset "$(BOARD_RAMDISK_OFFSET)"
BOARD_MKBOOTIMG_ARGS += --second_offset "$(BOARD_SECOND_OFFSET)"
BOARD_MKBOOTIMG_ARGS += --tags_offset "$(BOARD_TAGS_OFFSET)"

BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_PREBUILT_KERNEL := device/huawei/h60-common/zImage

# Inline kernel building
#BOARD_CUSTOM_KERNEL_MK := device/huawei/h60-common/customkernel.mk

# Filesystem
BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_BOOTIMAGE_PARTITION_SIZE := 14680064
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12759072768
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true

# Libc extensions
BOARD_PROVIDES_ADDITIONAL_BIONIC_STATIC_LIBS += libc_huawei_symbols

# Graphics
BOARD_EGL_CFG := device/huawei/h60-common/rootdir/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true

# ION
#BOARD_USE_CUSTOM_LIBION := true

# Audio
BOARD_USES_ALSA_AUDIO := true
#BOARD_USE_ICOS_MIRROR_SERVICE := true

# Camera
BOARD_CAMERA_HAVE_ISO := true
COMMON_GLOBAL_CFLAGS += -DHAVE_ISO

# Media
#BOARD_USE_HUAWEI_SERVICES := true

# RIL
BOARD_RIL_CLASS := ../../../device/huawei/h60-common/ril/

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4334
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcm4334_hw_dualband.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcm4334_apsta_hw_dualband.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/vendor/firmware/fw_bcm4334_hw_dualband.bin"
WIFI_BAND                        := 802_11_ABG

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/huawei/h60-common/bluetooth/vnd_h60.txt

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Selinux
BOARD_SEPOLICY_DIRS += \
    device/huawei/h60-common/selinux

BOARD_SEPOLICY_UNION += \
    file_contexts \
    installd.te

# Recovery
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := device/huawei/h60-common/rootdir/fstab.hi3630
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
BOARD_RECOVERY_NEEDS_FBIOPAN_DISPLAY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_USERIMAGES_USE_EXT4 := true

# inherit from the proprietary version
-include vendor/huawei/h60-common/BoardConfigVendor.mk
