#
# Copyright 2014 The Android Open-Source Project
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
PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    ro.opengles.version=196609

#enable this for support f2fs with data partion
#BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
# This ensures the needed build tools are available.
# TODO: make non-linux builds happy with external/f2fs-tool; system/extras/f2fs_utils
#ifeq ($(HOST_OS),linux)
#TARGET_USERIMAGES_USE_F2FS := true
#endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.udisk.visible=true \
    ro.rk.displayd.enable=true \
    ro.hdmi.device_type=4

PRODUCT_PROPERTY_OVERRIDES += \
    service.adb.tcp.port=5555

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.box.rc:root/init.box.rc \
    $(LOCAL_PATH)/init.tablet.rc:root/init.tablet.rc \
    $(LOCAL_PATH)/fstab.rk30board.bootmode.unknown:root/fstab.rk30board.bootmode.unknown \
    $(LOCAL_PATH)/fstab.rk30board.bootmode.sd:root/fstab.rk30board.bootmode.sd \
    $(LOCAL_PATH)/fstab.rk30board.bootmode.emmc:root/fstab.rk30board.bootmode.emmc \
    $(LOCAL_PATH)/recovery.emmc.fstab:recovery/root/etc/recovery.emmc.fstab \
    $(LOCAL_PATH)/recovery.sd.fstab:recovery/root/etc/recovery.sd.fstab

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fix_performance.sh:system/bin/fix_performance.sh

PRODUCT_COPY_FILES += \
	device/rockchip/rk3328/110b0030_pwm.kl:system/usr/keylayout/110b0030_pwm.kl\
	device/rockchip/rk3328/ff1b0030_pwm.kl:system/usr/keylayout/ff1b0030_pwm.kl \
	$(LOCAL_PATH)/audio_policy_rk3328.conf:system/etc/audio_policy.conf

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

$(call inherit-product-if-exists, vendor/rockchip/rk3328/device-vendor.mk)

