# Cleanup
rm -rf device/infinix tools hardware/ device/mediatek vendor/infinix vendor/mediatek hardware/mediatek android packages prebuilts prebuilt

# DT
BRANCH_DT=axion-16.2
BRANCH_VT=lineage-23.2
# ROM Init
BRANCH_ROM=lineage-23.2
repo init -u https://github.com/AxionAOSP/android.git -b ${BRANCH_ROM} --depth=1 --git-lfs
/opt/crave/resync.sh


#---------------------------------------------------
# Device 
git clone -b ${BRANCH_DT} https://github.com/zaidannn7/b device/infinix/X6882
git clone --depth=1 -b ${BRANCH_VT} https://gitlab.com/zaidannn7/vendor_infinix_X6882 vendor/infinix/X6882
git clone --depth=1 https://github.com/zaidannn7/device_infinix_X6882-kernel device/infinix/X6882-kernel
#----------------------------------------------------
# Mediatek Specific
git clone --depth=1 -b sixteen-oem https://github.com/MillenniumOSS/android_vendor_mediatek_ims vendor/mediatek/ims
git clone --depth=1 https://github.com/MillenniumOSS/android_hardware_millennium hardware/millennium
git clone --depth=1 https://github.com/MillenniumOSS/android_device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr
git clone --depth=1 https://github.com/MillenniumOSS/android_hardware_mediatek hardware/mediatek
git clone https://github.com/MillenniumOSS/android_device_millennium_common-kernel device/millennium/common-kernel
#-----------------------------------------------------
export BUILD_USERNAME=zaidannn7
export BUILD_HOSTNAME=android
export KBUILD_BUILD_NAME=zaidannn7
export KBUILD_BUILD_HOST=android

# Build
source build/envsetup.sh
axion X6882 user pico
ax -br -j$(nproc)


