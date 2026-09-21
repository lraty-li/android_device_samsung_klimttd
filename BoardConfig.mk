#
# SM-T705C / klimttd Android 10 strict Wi-Fi-only bring-up
# Based on exynos5420 klimtwifi lineage-17.1, preserving T705C partition/kernel specifics.
#

# Inherit from klimt-common
include device/samsung/klimt-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/klimttd

# Assert: TWRP for SM-T705C reports klimtlte; Android product remains klimttd.
TARGET_OTA_ASSERT_DEVICE := klimtlte,klimttd

# Kernel: T705C hardware config with Qualcomm modem/HSIC/diag disabled.
TARGET_KERNEL_CONFIG := lineageos_klimttd_wifionly_defconfig

# T705C partition sizes verified against the device PIT on 2026-09-20.
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2202009600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12889096192
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

# Use a common Exynos5420 manifest with GNSS removed for this no-modem/no-GPS test.
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml
DEVICE_MANIFEST_FILE += device/samsung/klimt-common/manifest.xml

# Empty but retained for vendor-tree compatibility.
-include vendor/samsung/klimttd/BoardConfigVendor.mk
