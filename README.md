# Samsung Galaxy Tab S 8.4 China (SM-T705C / klimttd) — LineageOS 17.1

Device configuration for the **Samsung Galaxy Tab S 8.4 China (SM-T705C, `klimttd`)** targeting **LineageOS 17.1 / Android 10**.

This tree was brought up as a **strict Wi-Fi-only / no-modem experiment** to isolate standby-power problems seen on older third-party ROMs. It is intentionally not a cellular build.

## Tested status

| Area | Status |
| --- | --- |
| Boot / Android framework | Working |
| Mali / SurfaceFlinger | Working with Android-Q compatibility fixes documented in the companion patchset |
| Wi-Fi | Working, including 5 GHz WPA2 with legacy Broadcom firmware compatibility patch |
| Sensors | Working: accelerometer, gyroscope, magnetometer, proximity, light, grip |
| Camera | Working at HAL/provider level; 2 cameras enumerate |
| Audio | HAL/service working |
| Bluetooth | Working: controller firmware loads, pairing succeeds, inbound OPP APK transfer validated |
| Cellular / RIL / modem | Intentionally disabled |
| GNSS/GPS | Intentionally disabled in the strict build |
| Deep sleep | Working; Wi-Fi OFF >110 h test reached ~99.1% deep sleep, Wi-Fi ON overnight reached ~96.1% |

## Important SM-T705C differences

The Chinese SM-T705C is **not** a drop-in `klimtlte` target.

Verified partition sizes used by this tree include:

- BOOT: `8,388,608` bytes
- RECOVERY: `10,485,760` bytes
- SYSTEM: `2,202,009,600` bytes

A normal `klimtlte` Android 10 tree assumes a larger SYSTEM partition, which can cause installation failure on SM-T705C even if the updater assert is bypassed.

## Strict Wi-Fi-only design

The product sets:

```text
ro.radio.noril=1
persist.radio.noril=1
ro.klimttd.wifi_only=1
```

The companion kernel patchset disables Qualcomm/Samsung modem, MDM-HSIC, RMNET, DIAG and related bridge options. The first strict build also omits GNSS so Qualcomm location/QMI code cannot reintroduce modem dependencies.

## Proprietary files

No Samsung proprietary blobs are included in this repository.

The tree references the SM-T705C sensor blob through `proprietary-files.txt` and installs the pinned BCM4350 Bluetooth firmware from `vendor/samsung/klimttd/proprietary/vendor/firmware/bcm4350_V0301.0609.hcd`. Obtain proprietary files from firmware/device sources you are legally allowed to use. The companion compatibility repository documents the expected hashes and reproducible Android-Q compatibility steps; proprietary binaries are not stored in these public repositories.

## Companion compatibility repository

To reproduce the validated Android 10 build, use this device tree together with:

`https://github.com/lraty-li/exynos5420-android10-compat`

That repository contains the common-device and kernel patches, proprietary-compatibility reproduction notes, a local-manifest template and build verification scripts.

Key fixes include:

- Android-Q Mali/libw compatibility details
- Exynos camera shim path correction
- Broadcom optional-MFP fallback for old firmware
- sensor multihal visibility notes
- pinned BCM4350 firmware placement/verification
- Bluetooth OPP Android-Q compatibility and APK inbound allowlist
- strict no-modem validation

## Source bases used during bring-up

- `exynos5420/android_device_samsung_klimtwifi`, branch `lineage-17.1`
- `exynos5420/android_device_samsung_klimtlte`, branch `lineage-17.1`
- `LineageOS/android_device_samsung_universal5420-common`, branch `lineage-17.1`
- `exynos5420/android_kernel_samsung_exynos5420`, branch `lineage-17.1`

This is an experimental community bring-up, not an official LineageOS target.
