#
# system properties for SM-T705C strict Wi-Fi-only test
#

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.radio.noril=1 \
    persist.radio.noril=1 \
    ro.klimttd.wifi_only=1
