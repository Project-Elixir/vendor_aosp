# Google Overlays
PRODUCT_PACKAGES += \
    DMServiceOverlay \
    FlipendoOverlay \
    GoogleConfigOverlay \
    GoogleDeviceLockControllerOverlay \
    GoogleHealthConnectOverlay \
    GoogleWebViewOverlay \
    ManagedProvisioningPixelOverlay \
    PixelConfigOverlay2018 \
    PixelConfigOverlay2019 \
    PixelConfigOverlay2019Midyear \
    PixelConfigOverlayCommon \
    PixelDocumentsUIGoogleOverlay \
    SettingsGoogleOverlayPixel2022 \
    SystemUIGXOverlay \
    AccessibilityMenuOverlay \
    CellBroadcastReceiverOverlay \
    MediaProviderOverlay

ifeq ($(TARGET_IS_PIXEL), true)
PRODUCT_PACKAGES += \
    NowPlayingOverlay \
    PixelBatteryHealthOverlay \
    PixelDisableLEDOverlay \
    PixelSetupWizardOverlay2019 \
    PixelSetupWizardOverlay2021
endif

ifeq ($(TARGET_IS_PIXEL_7), true)
PRODUCT_PACKAGES += \
    ClearCallingSettingsOverlay2022 \
    PixelConnectivityOverlay2022
endif

ifeq ($(TARGET_PIXEL_STAND_SUPPORTED), true)
PRODUCT_PACKAGES += \
    DreamlinerOverlay
endif
