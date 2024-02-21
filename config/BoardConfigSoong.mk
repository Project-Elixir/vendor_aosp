PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE \
    TARGET_KERNEL_HEADERS

SOONG_CONFIG_NAMESPACES += customVarsPlugin

SOONG_CONFIG_customVarsPlugin :=

define addVar
  SOONG_CONFIG_customVarsPlugin += $(1)
  SOONG_CONFIG_customVarsPlugin_$(1) := $($1)
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += customGlobalVars
SOONG_CONFIG_customGlobalVars += \
    aapt_version_code \
    additional_gralloc_10_usage_bits \
    has_legacy_camera_hal1 \
    camera_needs_client_info \
    camera_needs_client_info_lib \
    camera_needs_client_info_lib_oplus \
    disable_bluetooth_le_read_buffer_size_v2 \
    disable_bluetooth_le_set_host_feature \
    bootloader_message_offset \
    uses_oppo_camera \
    camera_override_format_from_reserved \
    gralloc_handle_has_custom_content_md_reserved_size \
    gralloc_handle_has_reserved_size \
    sdmcore_has_is_display_hw_available_func \
    needs_camera_boottime \
    target_alternative_futex_waiters \
    camera_uses_newer_hidl_override_format \
    target_init_vendor_lib \
    target_inputdispatcher_skip_event_key \
    target_ld_shim_libs \
    target_surfaceflinger_udfps_lib \
    target_uses_prebuilt_dynamic_partitions \
    uses_camera_parameter_lib \
    uses_legacy_fd_fbdev \
    uses_egl_display_array \
    needs_oplus_tag \
    uses_oplus_camera \
    uses_nothing_camera \
    include_miui_camera \
    uses_miui_camera

SOONG_CONFIG_NAMESPACES += customNvidiaVars
SOONG_CONFIG_customNvidiaVars += \
    uses_nvidia_enhancements

SOONG_CONFIG_NAMESPACES += customQcomVars
SOONG_CONFIG_customQcomVars += \
    qti_vibrator_effect_lib \
    qti_vibrator_use_effect_stream \
    supports_extended_compress_format \
    uses_pre_uplink_features_netmgrd 

# Only create display_headers_namespace var if dealing with UM platforms to avoid breaking build for all other platforms
ifneq ($(filter $(UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_customQcomVars += \
    qcom_display_headers_namespace
endif

# Soong bool variables
SOONG_CONFIG_customGlobalVars_camera_needs_client_info := $(TARGET_CAMERA_NEEDS_CLIENT_INFO)
SOONG_CONFIG_customGlobalVars_camera_needs_client_info_lib := $(TARGET_CAMERA_NEEDS_CLIENT_INFO_LIB)
SOONG_CONFIG_customGlobalVars_camera_needs_client_info_lib_oplus := $(TARGET_CAMERA_NEEDS_CLIENT_INFO_LIB_OPLUS)
SOONG_CONFIG_customGlobalVars_needs_camera_boottime := $(TARGET_CAMERA_BOOTTIME_TIMESTAMP)
SOONG_CONFIG_customGlobalVars_target_alternative_futex_waiters := $(TARGET_ALTERNATIVE_FUTEX_WAITERS)
SOONG_CONFIG_customGlobalVars_camera_uses_newer_hidl_override_format := $(TARGET_CAMERA_USES_NEWER_HIDL_OVERRIDE_FORMAT)
SOONG_CONFIG_customGlobalVars_uses_egl_display_array := $(TARGET_USES_EGL_DISPLAY_ARRAY)
SOONG_CONFIG_customGlobalVars_target_uses_prebuilt_dynamic_partitions := $(TARGET_USES_PREBUILT_DYNAMIC_PARTITIONS)
SOONG_CONFIG_customGlobalVars_needs_oplus_tag := $(TARGET_NEEDS_OPLUS_VENDOR_TAG)
SOONG_CONFIG_customGlobalVars_uses_oppo_camera := $(TARGET_USES_OPPO_CAMERA)
SOONG_CONFIG_customGlobalVars_uses_oplus_camera := $(TARGET_USES_OPLUS_CAMERA)
SOONG_CONFIG_customGlobalVars_uses_nothing_camera := $(TARGET_USES_NOTHING_CAMERA)
SOONG_CONFIG_customNvidiaVars_uses_nvidia_enhancements := $(NV_ANDROID_FRAMEWORK_ENHANCEMENTS)
SOONG_CONFIG_customQcomVars_supports_extended_compress_format := $(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT)
SOONG_CONFIG_customQcomVars_uses_pre_uplink_features_netmgrd := $(TARGET_USES_PRE_UPLINK_FEATURES_NETMGRD)
SOONG_CONFIG_customGlobalVars_uses_legacy_fd_fbdev := $(TARGET_USES_LEGACY_FD_FBDEV)
SOONG_CONFIG_customGlobalVars_gralloc_handle_has_reserved_size := $(TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE)
SOONG_CONFIG_evolutionGlobalVars_sdmcore_has_is_display_hw_available_func := $(TARGET_SDMCORE_HAS_IS_DISPLAY_HW_AVAILABLE_FUNC)
SOONG_CONFIG_customGlobalVars_gralloc_handle_has_custom_content_md_reserved_size := $(TARGET_GRALLOC_HANDLE_HAS_CUSTOM_CONTENT_MD_RESERVED_SIZE)
SOONG_CONFIG_customGlobalVars_gralloc_handle_has_ubwcp_format := $(TARGET_GRALLOC_HANDLE_HAS_UBWCP_FORMAT)
SOONG_CONFIG_customGlobalVars_camera_override_format_from_reserved := $(TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED)
SOONG_CONFIG_customGlobalVars_include_miui_camera := $(TARGET_INCLUDES_MIUI_CAMERA)
SOONG_CONFIG_customGlobalVars_uses_miui_camera := $(TARGET_USES_MIUI_CAMERA)

# Set default values
BOOTLOADER_MESSAGE_OFFSET ?= 0
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS ?= 0
TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED ?= false
TARGET_GRALLOC_HANDLE_HAS_CUSTOM_CONTENT_MD_RESERVED_SIZE ?= false
TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE ?= false
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_INPUTDISPATCHER_SKIP_EVENT_KEY ?= 0
TARGET_QTI_VIBRATOR_USE_EFFECT_STREAM ?= true
TARGET_QTI_VIBRATOR_EFFECT_LIB ?= libqtivibratoreffect
TARGET_SDMCORE_HAS_IS_DISPLAY_HW_AVAILABLE_FUNC ?= true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY ?= libcamera_parameters
TARGET_SURFACEFLINGER_UDFPS_LIB ?= surfaceflinger_udfps_lib
TARGET_GRALLOC_HANDLE_HAS_UBWCP_FORMAT ?= false

# Soong value variables
SOONG_CONFIG_customGlobalVars_aapt_version_code := $(shell date -u +%Y%m%d)
SOONG_CONFIG_customGlobalVars_additional_gralloc_10_usage_bits := $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS)
SOONG_CONFIG_customGlobalVars_bootloader_message_offset := $(BOOTLOADER_MESSAGE_OFFSET)
SOONG_CONFIG_customGlobalVars_disable_bluetooth_le_read_buffer_size_v2 := $(TARGET_DISABLE_BLUETOOTH_LE_READ_BUFFER_SIZE_V2)
SOONG_CONFIG_customGlobalVars_disable_bluetooth_le_set_host_feature := $(TARGET_DISABLE_BLUETOOTH_LE_SET_HOST_FEATURE)
SOONG_CONFIG_customGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_customGlobalVars_has_legacy_camera_hal1 := $(TARGET_HAS_LEGACY_CAMERA_HAL1)
SOONG_CONFIG_customGlobalVars_target_ld_shim_libs := $(subst $(space),:,$(TARGET_LD_SHIM_LIBS))
SOONG_CONFIG_customGlobalVars_uses_camera_parameter_lib := $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)
SOONG_CONFIG_customGlobalVars_target_surfaceflinger_udfps_lib := $(TARGET_SURFACEFLINGER_UDFPS_LIB)
SOONG_CONFIG_customGlobalVars_target_inputdispatcher_skip_event_key := $(TARGET_INPUTDISPATCHER_SKIP_EVENT_KEY)

ifneq ($(filter $(QSSI_SUPPORTED_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_customQcomVars_qcom_display_headers_namespace := vendor/qcom/opensource/commonsys-intf/display
else
SOONG_CONFIG_customQcomVars_qcom_display_headers_namespace := $(QCOM_SOONG_NAMESPACE)/display
endif

SOONG_CONFIG_customQcomVars_qti_vibrator_use_effect_stream := $(TARGET_QTI_VIBRATOR_USE_EFFECT_STREAM)
SOONG_CONFIG_customQcomVars_qti_vibrator_effect_lib := $(TARGET_QTI_VIBRATOR_EFFECT_LIB)

ifneq ($(TARGET_USES_NQ_NFC),true)
PRODUCT_SOONG_NAMESPACES += hardware/nxp
endif #TARGET_USES_NQ_NFC
