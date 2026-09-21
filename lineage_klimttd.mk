#
# LineageOS 17.1 / Android 10 product for SM-T705C strict Wi-Fi-only test
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/samsung/klimttd/device.mk)
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_DEVICE := klimttd
PRODUCT_NAME := lineage_klimttd
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T705C
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=klimtltetdzc \
    PRIVATE_BUILD_DESC="klimtltetdzc-user 6.0.1 MMB29K T705CZCU1CVG1 release-keys"

BUILD_FINGERPRINT := samsung/klimtltetdzc/klimtlte:6.0.1/MMB29K/T705CZCU1CVG1:user/release-keys
