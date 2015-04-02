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

# This device is xxhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xxhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

COMMON_PATH := device/huawei/h60-common

DEVICE_PACKAGE_OVERLAYS := $(COMMON_PATH)/overlay

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Ramdisk
PRODUCT_COPY_FILES := \
    $(COMMON_PATH)/rootdir/fstab.hi3630:root/fstab.hi3630 \
    $(COMMON_PATH)/rootdir/init.hi3630.rc:root/init.hi3630.rc \
    $(COMMON_PATH)/rootdir/init.hi3630.usb.rc:root/init.hi3630.usb.rc \
    $(COMMON_PATH)/rootdir/ueventd.hi3630.rc:root/ueventd.hi3630.rc

# Recovery
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/rootdir/init.recovery.hi3630.rc:root/init.recovery.hi3630.rc \
    $(COMMON_PATH)/recovery/rootdir/sbin/hw_chargecheck:root/sbin/hw_chargecheck \
    $(COMMON_PATH)/recovery/rootdir/res/images/charger/battery_0.png:root/res/images/charger/battery_0.png \
    $(COMMON_PATH)/recovery/rootdir/res/images/charger/battery_1.png:root/res/images/charger/battery_1.png \
    $(COMMON_PATH)/recovery/rootdir/res/images/charger/battery_2.png:root/res/images/charger/battery_2.png \
    $(COMMON_PATH)/recovery/rootdir/res/images/charger/battery_3.png:root/res/images/charger/battery_3.png \
    $(COMMON_PATH)/recovery/rootdir/res/images/charger/battery_4.png:root/res/images/charger/battery_4.png \
    $(COMMON_PATH)/recovery/rootdir/res/images/charger/battery_5.png:root/res/images/charger/battery_5.png \
    $(COMMON_PATH)/recovery/rootdir/res/images/charger/battery_charge.png:root/res/images/charger/battery_charge.png \
    $(COMMON_PATH)/recovery/rootdir/res/images/charger/battery_fail.png:root/res/images/charger/battery_fail.png

PRODUCT_PACKAGES += \
    mkbootimg-h60 \
    unpackbootimg-h60 \
    charger-h60

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/audio_effects.conf:system/etc/audio_effects.conf \
    $(COMMON_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudioutils \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# Wifi
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    libnetcmdiface \
    libwpa_client \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/gps.conf:system/etc/gps.conf \
    $(COMMON_PATH)/rootdir/system/etc/gpsconfig.xml:system/etc/gpsconfig.xml \
    $(COMMON_PATH)/rootdir/system/etc/gpsconfig_cl.xml:system/etc/gpsconfig_cl.xml \
    $(COMMON_PATH)/rootdir/system/etc/gpsconfig_tlg.xml:system/etc/gpsconfig_tlg.xml

# Lights
PRODUCT_PACKAGES += \
    lights.hi3630

# Media
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/rootdir/system/etc/vdec_atlas.cfg:system/etc/vdec_atlas.cfg \
    $(COMMON_PATH)/rootdir/system/etc/topazhp.cfg:system/etc/topazhp.cfg

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/camera_config.cfg:system/etc/camera_config.cfg: \
    $(COMMON_PATH)/rootdir/system/etc/camera_orientation.cfg:system/etc/camera_orientation.cfg \
    $(COMMON_PATH)/rootdir/system/etc/camera_resolutions.cfg:system/etc/camera_resolutions.cfg \
    $(COMMON_PATH)/rootdir/system/etc/camera_videosnapshot.cfg:system/etc/camera_videosnapshot.cfg

PRODUCT_PACKAGES += \
    camera.hi3630

# Misc
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/lte_ue_msg.cfg:system/etc/lte_ue_msg.cfg \
    $(COMMON_PATH)/rootdir/system/etc/thermald.xml:system/etc/thermald.xml \
    $(COMMON_PATH)/rootdir/system/etc/thermald_performance.xml:system/etc/thermald_performance.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/hi3630_keypad.kl:system/usr/keylayout/hi3630_keypad.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_1bad_Product_f016.kl:system/usr/keylayout/Vendor_1bad_Product_f016.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_1bad_Product_f023.kl:system/usr/keylayout/Vendor_1bad_Product_f023.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_1bad_Product_f027.kl:system/usr/keylayout/Vendor_1bad_Product_f027.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_1bad_Product_f036.kl:system/usr/keylayout/Vendor_1bad_Product_f036.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_1d79_Product_0009.kl:system/usr/keylayout/Vendor_1d79_Product_0009.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_12bd_Product_d015.kl:system/usr/keylayout/Vendor_12bd_Product_d015.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c219.kl:system/usr/keylayout/Vendor_046d_Product_c219.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_0079_Product_0011.kl:system/usr/keylayout/Vendor_0079_Product_0011.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_0583_Product_2060.kl:system/usr/keylayout/Vendor_0583_Product_2060.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_1038_Product_1412.kl:system/usr/keylayout/Vendor_1038_Product_1412.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_1689_Product_fd00.kl:system/usr/keylayout/Vendor_1689_Product_fd00.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_1689_Product_fd01.kl:system/usr/keylayout/Vendor_1689_Product_fd01.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_1689_Product_fe00.kl:system/usr/keylayout/Vendor_1689_Product_fe00.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Vendor_2378_Product_100a.kl:system/usr/keylayout/Vendor_2378_Product_100a.kl

# Graphics
PRODUCT_PACKAGES += \
	libsurfaceflinger_client

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    audioril.lib=libhuawei-audio-ril.so \
    ro.telephony.ril_class=HuaweiRIL

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    telephony.lteOnGsmDevice=1 \
    ro.telephony.default_network=9

# Live Wallpapers
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    librs_jni

# Additional packages
PRODUCT_PACKAGES += \
    Torch \
    com.android.future.usb.accessory

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# NFC
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(COMMON_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

PRODUCT_PACKAGES += \
	libnfc-nci \
	libnfc_nci_jni \
	Nfc \
	Tag \
	com.android.nfc_extras
	
PRODUCT_COPY_FILES += \
	packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt \
	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
	NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml
else
	NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
	$(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# USB OTG support
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.isUsbOtgEnabled=true

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Include non-opensource parts
$(call inherit-product, vendor/huawei/h60-common/common-vendor.mk)
