# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/mixins/groups/audio/remote/product.mk
##############################################################
TARGET_USE_AUDIO_VHAL := true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.media_vol_default=15 \
    virtual.audio.pusher.tcp.port=8765 \
    virtual.audio.in.tcp.port=8767 \
    virtual.audio.out.tcp.port=8768 \
    virtual.info.tcp.port=8769

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/audio/audio_policy_configuration.xml:system/vendor/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/vendor/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/vendor/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/vendor/etc/default_volume_tables.xml \

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    audio.r_submix.default \
    audio.primary.$(TARGET_PRODUCT) \
    SoundRecorder
##############################################################
# Source: device/intel/mixins/groups/bluetooth/dummy/product.mk
##############################################################
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service \
    android.hardware.bluetooth@1.0-impl

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml

##############################################################
# Source: device/intel/mixins/groups/camera/remote/product.mk
##############################################################
TARGET_USE_CAMERA_VHAL := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/vendor/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/vendor/etc/permissions/android.hardware.camera.full.xml \

PRODUCT_PACKAGES += \
    camera.$(TARGET_PRODUCT) \
    camera.$(TARGET_PRODUCT).jpeg \
    Camera2 \
    camera.device@1.0-impl \
    android.hardware.camera.provider@2.4-service_64 \
    android.hardware.camera.provider@2.4-impl

PRODUCT_PROPERTY_OVERRIDES += \
    remote.sf.fake_camera=both \
    persist.remote.camera.orientation=landscape

# camera support
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-impl
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-external-service
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/camera/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml

##############################################################
# Source: device/intel/mixins/groups/device-specific/cic-cloud/product.mk
##############################################################
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/board/generic_x86_64/device.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.qemu=0 \
    service.activity.monitor.port=8770 \
    aic.cmd.channel.port=8771 \
    service.file.transer.port=8773 \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.nobootanimation=1

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rc:root/init.$(TARGET_PRODUCT).rc \
    $(LOCAL_PATH)/fstab:root/fstab.$(TARGET_PRODUCT) \
    $(LOCAL_PATH)/ueventd.rc:root/ueventd.$(TARGET_PRODUCT).rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/device-specific/cic_cloud-removed-permissions.xml:system/etc/permissions/cic_cloud-removed-permissions.xml \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# sdcard
PRODUCT_COPY_FILES += \
    out/target/product/$(TARGET_PRODUCT)/system/bin/sdcard-fuse:system/bin/sdcard

# disable ununsed service
PRODUCT_PROPERTY_OVERRIDES += config.disable_systemtextclassifier=true
PRODUCT_PROPERTY_OVERRIDES += config.disable_otadexopt=true
PRODUCT_PROPERTY_OVERRIDES += gsm.version.baseband=FM_BASE_18A_RLS2_ISHARKL2_W18.18.5|sc9853_modem|05-04-2018 13:55:11
PRODUCT_PROPERTY_OVERRIDES += gsm.version.baseband1=FM_BASE_18A_RLS2_ISHARKL2_W18.18.5|sc9853_modem|05-04-2018 13:55:11

#disable sdcardfs support
PRODUCT_PROPERTY_OVERRIDES += external_storage.sdcardfs.enabled=false

PRODUCT_PROPERTY_OVERRIDES += \
    enable.restrictions=true \
    enable.sec_key_att_app_id_provider=true \
    enable.power=true \
    enable.launcher=true \
    enable.settings=true \
    enable.clipboard=true \
    enable.network_score=true \
    enable.telephony.registry=true \
    enable.netstats=true \
    enable.batterystats=true

# Remove PrintSpooler after we disabled SystemUI to fix tombstone issue.
# And, enable SystemUI by default for convenience.
PRODUCT_PACKAGES_DELETE += PrintSpooler
PRODUCT_PROPERTY_OVERRIDES += enable.systemui=true

PRODUCT_HOST_PACKAGES += \
    aic-build \
    aic-publish \
    bios.bin \
    vgabios-cirrus.bin \
    docker \
    cpio \
    container-diff \
    dock-delta \
    dock-extract

# Device modules
PRODUCT_PACKAGES += \
    sh_vendor \
    vintf \
    toybox_vendor

PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# need this for gles libraries to load properly
# after moving to /vendor/lib/
PRODUCT_PACKAGES += \
    vndk-sp

PRODUCT_PACKAGES += \
    sdcard-fuse

# deploy prebuilt apps
PRODUCT_PACKAGES += \
    prebuilt_apps

PRODUCT_PACKAGES += DummyHome

PRODUCT_PACKAGES += \
    webrtc_mgr.sh \
    AicCommandChannelService \
    setcap \
    getcap

# The list of packages that we want to remove from default configuration.
PRODUCT_PACKAGES_DELETE += \
    BackupRestoreConfirmation \
    BasicDreams \
    BlockedNumberProvider \
    Bluetooth \
    BluetoothMidiService \
    BookmarkProvider \
    BuiltInPrintService \
    Calendar \
    CalendarProvider \
    CaptivePortalLogin \
    CertInstaller \
    CompanionDeviceManager \
    Contacts \
    CtsShimPrebuilt \
    CtsShimPrivPrebuilt \
    DeskClock \
    DisplayCutoutEmulationCornerOverlay \
    DisplayCutoutEmulationDoubleOverlay \
    DisplayCutoutEmulationTallOverlay \
    DocumentsUI \
    DownloadProviderUi \
    EasterEgg \
    Email \
    ExactCalculator \
    ExternalStorageProvider \
    ExtServices \
    ExtShared \
    HTMLViewer \
    InputDevices \
    KeyChain \
    LiveWallpapersPicker \
    ManagedProvisioning \
    MmsService \
    MtpDocumentsProvider \
    MusicFX \
    NfcNci \
    OneTimeInitializer \
    PacProcessor \
    PhotoTable \
    PrintRecommendationService \
    ProxyHandler \
    QuickSearchBox \
    SecureElement \
    SharedStorageBackup \
    SimAppDialog \
    StatementService \
    StorageManager \
    SysuiDarkThemeOverlay \
    Traceur \
    VpnDialogs \
    WallpaperBackup \
    WallpaperCropper \
    WAPPushManager \
    incidentd \
    libpac \
    perfprofd \
    statsd \
    thermalserviced \
    mediametrics

TARGET_USE_LIBVHAL_CLIENT := false
TARGET_USE_ICR := false

# LIBVHAL-CLIENT
ifeq ($(TARGET_USE_LIBVHAL_CLIENT), true)
PRODUCT_PACKAGES += libvhal-client
endif

# ICR
ifeq ($(TARGET_USE_ICR), true)
PRODUCT_PACKAGES += \
    icr_encoder \
    libirr_encoder \
    libicr_alloc \
    libsock_utilss \
    libvhal-client
endif
##############################################################
# Source: device/intel/mixins/groups/codecs/configurable/product.mk
##############################################################
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/extra_files/codecs/mfx_omxil_core.conf:system/vendor/etc/mfx_omxil_core.conf \
    $(LOCAL_PATH)/extra_files/codecs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_profiles.xml:system/vendor/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs.xml:system/vendor/etc/media_codecs.xml

##############################################################
# Source: device/intel/mixins/groups/debug-crashlogd/true/product.mk
##############################################################
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/debug-crashlogd/ingredients.conf:system/vendor/etc/ingredients.conf \
    $(LOCAL_PATH)/extra_files/debug-crashlogd/crashlog.conf:system/vendor/etc/crashlog.conf

PRODUCT_PACKAGES += \
    crashlogd \
    dumpstate_dropbox.sh

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.crashlogd.data_quota=50

CRASHLOGD_LOGS_PATH := "/data/logs"
CRASHLOGD_APLOG := true
CRASHLOGD_FULL_REPORT := true

#binder
CRASHLOGD_MODULE_BINDER := true

CRASHLOGD_USE_SD := false

##############################################################
# Source: device/intel/mixins/groups/debug-logs/true/product.mk
##############################################################
PRODUCT_PACKAGES += \
    elogs.sh \
    start_log_srv.sh \
    logcat_ep.sh

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.service.default_logfs=apklogfs
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.intel.logger=/system/bin/logcat
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.logd.kernel.raw_message=false
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.intel.logger.rot_cnt=20
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.intel.logger.rot_size=5000

##############################################################
# Source: device/intel/mixins/groups/gps/remote/product.mk
##############################################################
TARGET_USE_GPS_VHAL := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/vendor/etc/permissions/android.hardware.location.gps.xml \
    vendor/intel/cic/target/gps/cloud/system/vendor/etc/init/android.hardware.gnss@2.0-service.cic_cloud.rc:system/vendor/etc/init/android.hardware.gnss@2.0-service.cic_cloud.rc \
    vendor/intel/cic/target/gps/cloud/system/vendor/bin/hw/android.hardware.gnss@2.0-service.cic_cloud:system/vendor/bin/hw/android.hardware.gnss@2.0-service.cic_cloud

PRODUCT_PACKAGES += \
    android.hardware.gnss@2.0-service.$(TARGET_PRODUCT)

PRODUCT_PROPERTY_OVERRIDES += \
    virtual.gps.tcp.port=8766

##############################################################
# Source: device/intel/mixins/groups/graphics/true/product.mk
##############################################################
TARGET_USE_GRALLOC_VHAL := false
TARGET_USE_HWCOMPOSER_VHAL := true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:system/vendor/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:system/vendor/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/vendor/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:system/vendor/etc/permissions/android.hardware.vulkan.version-1_1.xml

PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.3-service.clearkey \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl

PRODUCT_PACKAGES += \
    vulkan.intel \
    libEGL_mesa \
    libGLESv1_CM_mesa \
    libGLESv2_mesa \
    libgallium_dri \
    libglapi \
    libdrm \
    libdrm_intel \
    libEGL_swiftshader \
    libGLESv1_CM_swiftshader \
    libGLESv2_swiftshader \
    libgrallocclient \
    libsync \
    gralloc.intel_sw \
    libtextureservice \
    hwcomposer.intel_sw \
    egl.cfg \
    lib_renderControl_enc \
    libGLESv2_enc \
    libOpenglSystemCommon \
    libGLESv1_enc

PRODUCT_PACKAGES += \
    hwcomposer.goldfish \
    hwcomposer.ranchu \

ifeq ($(TARGET_USE_GRALLOC_VHAL), true)
PRODUCT_PACKAGES += gralloc_imp.intel
else
PRODUCT_PACKAGES += gralloc.intel
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.gralloc=intel_sw \
    ro.hardware.hwcomposer=intel_sw \
    ro.hardware.egl=swiftshader \
    ro.hardware.vulkan=intel \
    debug.hwui.disable=1 \
    debug.egl.printFPS=60 \
    ro.opengles.version=196610 \
    linker.hugetlbfs.elfs=iris_dri.so:gallium_dri.so:libunity.so

##############################################################
# Source: device/intel/mixins/groups/health/true/product.mk
##############################################################
# Default Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl
##############################################################
# Source: device/intel/mixins/groups/houdini/true/product.mk
##############################################################
# Houdini compatibility improvement for PRC market
PRODUCT_PROPERTY_OVERRIDES += ro.sys.prc_compatibility=1

TARGET_SUPPORTS_64_BIT_APPS := true

PRODUCT_PACKAGES += libhoudini houdini
PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm=x86 ro.vendor.enable.native.bridge.exec=1

ENABLE_NATIVEBRIDGE_64BIT := false
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
  ENABLE_NATIVEBRIDGE_64BIT = true
else
  ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
    ENABLE_NATIVEBRIDGE_64BIT = true
  endif
endif
ifeq ($(ENABLE_NATIVEBRIDGE_64BIT),true)
  PRODUCT_PACKAGES += houdini64
  PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm64=x86_64 ro.vendor.enable.native.bridge.exec64=1
endif
PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.native.bridge=libhoudini.so

TARGET_KERNEL_ARCH := x86_64
##############################################################
# Source: device/intel/mixins/groups/input/remote/product.mk
##############################################################
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/vendor/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

PRODUCT_PROPERTY_OVERRIDES += \
    virtual.input.keyboard=0 \
    virtual.input.num=1 \
    virtual.input.status=0 \
    virtual.input.joystick.status=0

##############################################################
# Source: device/intel/mixins/groups/media/true/product.mk
##############################################################
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/media/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/vendor/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/vendor/etc/media_codecs_google_video.xml

USE_ONEVPL := true

PRODUCT_PACKAGES += \
    libvpl \
    libmfx-gen \
    i965_drv_video \
    libmfxhw32 \
    libmfxhw64 \
    libmfx_omx_core \
    libmfx_omx_components_hw \
    libstagefrighthw \
    libva-android \
    libva

##############################################################
# Source: device/intel/mixins/groups/neuralnetworks/true/product.mk
##############################################################
# neuralnetworks HAL
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3-generic-service \
    android.hardware.neuralnetworks@1.3-generic-impl \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/neuralnetworks/plugins.xml:system/vendor/etc/openvino/plugins.xml \


PRODUCT_PACKAGES += \
    libopenvino \
    libopenvino_intel_cpu_plugin \
    libopenvino_ir_frontend

PRODUCT_PROPERTY_OVERRIDES += vendor.nn.hal.ngraph=true
##############################################################
# Source: device/intel/mixins/groups/power/dummy/product.mk
##############################################################
PRODUCT_PACKAGES += \
    power.default \
    android.hardware.power-service.example \
    android.hardware.power.stats@1.0-service.mock
##############################################################
# Source: device/intel/mixins/groups/sensors/remote/product.mk
##############################################################
TARGET_USE_SENSOR_VHAL := true

PRODUCT_PROPERTY_OVERRIDES += \
    system_init.startsensorservice=1

PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.intel

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/vendor/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/vendor/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/vendor/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/vendor/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:system/vendor/etc/permissions/android.hardware.sensor.ambient_temperature.xml
##############################################################
# Source: device/intel/mixins/groups/wlan/dummy/product.mk
##############################################################
PRODUCT_PACKAGES += \
    wpa_supplicant \
    hostapd

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml

PRODUCT_PROPERTY_OVERRIDES += sys.container.fakewifi=true
# ------------------ END MIX-IN DEFINITIONS ------------------
