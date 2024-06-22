#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/lge/judyp

# Inherit from common device tree
include device/lge/sdm845-common/BoardConfigCommon.mk

# Camera
TARGET_USES_YCRCB_VENUS_CAMERA_PREVIEW := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/framework_compatibility_matrix.xml

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hardware=judyp androidboot.fstab_suffix=judyp
TARGET_KERNEL_CONFIG := lineageos_judyp_defconfig

# Lights
$(call soong_config_set,LGE_LIGHTS_HAL,INCLUDE_DIR,$(DEVICE_PATH)/include)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VENDORIMAGE_PARTITION_SIZE := 1048576000

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# inherit from the proprietary version
include vendor/lge/judyp/BoardConfigVendor.mk
