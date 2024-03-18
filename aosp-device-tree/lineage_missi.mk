#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from missi device
$(call inherit-product, device/qualcomm/missi/device.mk)

PRODUCT_DEVICE := missi
PRODUCT_NAME := lineage_missi
PRODUCT_BRAND := qti
PRODUCT_MODEL := missi_pad_cn system image for arm64
PRODUCT_MANUFACTURER := qualcomm

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="missi_pad_cn-user 13 TKQ1.221114.001 V816.0.1.0.TKZCNXM release-keys"

BUILD_FINGERPRINT := qti/missi_pad_cn/missi:13/TKQ1.221114.001/V816.0.1.0.TKZCNXM:user/release-keys
