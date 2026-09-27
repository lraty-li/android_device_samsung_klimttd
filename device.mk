#
# SM-T705C / klimttd Android 10 strict Wi-Fi-only bring-up
#

LOCAL_PATH := device/samsung/klimttd

KLIMTTD_STRICT_WIFI_ONLY := true

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    init.target.rc

# T705C-specific sensor blob. Do not inherit the klimttd vendor package: it
# also installs Qualcomm modem/RIL/QMI/GPS components that are intentionally
# excluded from the first standby test.
PRODUCT_COPY_FILES += \
    vendor/samsung/klimttd/proprietary/vendor/firmware/bcm4350_V0301.0609.hcd:$(TARGET_COPY_OUT_VENDOR)/firmware/bcm4350_V0301.0609.hcd \
    vendor/samsung/klimttd/proprietary/lib/hw/sensors.universal5420.so:system/lib/hw/sensors.universal5420.so \
    vendor/samsung/klimttd/proprietary/lib/hw/sensors.universal5420.so:$(TARGET_COPY_OUT_VENDOR)/lib/sensors.universal5420.so

# Vendor security patch level from the currently installed Samsung Android 6 baseline.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2017-02-01

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Inherit platform/tablet common configuration and common proprietary blobs.
$(call inherit-product, device/samsung/klimt-common/device-common.mk)
