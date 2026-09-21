# SM-T705C LineageOS 14.1 strict Wi-Fi-only baseline

This branch preserves the **Android 7.1.2 / LineageOS 14.1 strict Wi-Fi-only/no-modem configuration** that was used as the first successful low-power baseline during SM-T705C bring-up.

It is intentionally not a cellular build.

## Tested behavior

A clean-device standby sanity run used:

- Wi-Fi on
- Bluetooth off
- screen off
- no GApps
- no Magisk
- no third-party applications

Measured Android batterystats interval:

```text
Time on battery:          20m10.327s
Screen-off time:          20m02.982s
CPU uptime on battery:       22.529s
Partial wakelocks:             5.444s
Battery:                    77% -> 77%
Mobile radio active:          0ms
```

Approximate suspend fraction from realtime-vs-uptime is about **98.1%**.

Kernel logs showed repeated real `PM: Entering mem sleep`. Retained resume causes were primarily the Broadcom Wi-Fi IRQ (`bcmsdh_sdmmc`) plus one power-management IRQ. No modem/MDM/HSIC/QMI/DIAG/RMNET wakeup source was present.

## Strict changes on this branch

- removes `full_base` telephony inheritance
- removes LineageOS telephony product inheritance
- keeps `common_full_tablet_wifionly.mk`
- removes `android.hardware.telephony.gsm.xml`
- sets:

```text
ro.radio.noril=1
persist.radio.noril=1
ro.klimttd.wifi_only=1
```

- removes T705C RIL/modem/location properties from `system.prop`
- removes `ks_9x15` / `efsks` root symlinks
- uses `lineageos_deathly_klimttd_wifionly_defconfig`

The companion compatibility repository branch `cm-14.1-wifionly` contains the required kernel defconfig/vendor patch and pinned source manifest.

## Known limitation

The Android 7 baseline still showed Qualcomm location HAL/QMI retry logs even though the modem/RIL kernel paths were disabled. Those retries did **not** prevent deep sleep in the 20-minute sanity test. This branch is kept as a reproducible power baseline, not as a claim that every Qualcomm location component has been removed.

## Security

Android 7.1.2 / LineageOS 14.1 is obsolete. Treat this as a legacy-device bring-up/reference build, not a secure OS for sensitive use.
