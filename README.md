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
| Bluetooth | Basic service reaches ON; see companion notes for early-boot/codec caveats |
| Cellular / RIL / modem | Intentionally disabled |
| GNSS/GPS | Intentionally disabled in the strict build |
| Deep sleep | Working; short Wi-Fi-on standby test showed repeated kernel mem-suspend and ~95% suspend time |

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

The tree references the SM-T705C sensor blob through `proprietary-files.txt`; obtain proprietary files from firmware/device sources you are legally allowed to use. See the companion compatibility repository for reproducible blob transformations required by old Exynos5420 Android-Q graphics.

## Companion compatibility repository

To reproduce the validated Android 10 build, use this device tree together with:

`https://github.com/lraty-li/exynos5420-android10-compat`

That repository contains the common-device and kernel patches, proprietary-compatibility reproduction notes, a local-manifest template and build verification scripts.

Key fixes include:

- Android-Q Mali/libw compatibility details
- Exynos camera shim path correction
- Broadcom optional-MFP fallback for old firmware
- sensor multihal visibility notes
- strict no-modem validation

## Source bases used during bring-up

- `exynos5420/android_device_samsung_klimtwifi`, branch `lineage-17.1`
- `exynos5420/android_device_samsung_klimtlte`, branch `lineage-17.1`
- `LineageOS/android_device_samsung_universal5420-common`, branch `lineage-17.1`
- `exynos5420/android_kernel_samsung_exynos5420`, branch `lineage-17.1`

This is an experimental community bring-up, not an official LineageOS target.
