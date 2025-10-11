# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
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

ARROW_MOD_VERSION = v13.1
ARROW_TYPE := reg
ARROW_BUILD_ZIP_TYPE := vanilla

DEVICE_MAINTAINER ?= UNKNOWN
DEVICE_MAINTAINER_LINK ?= UNKNOWN

ifeq ($(ARROW_GAPPS), true)
    $(call inherit-product, vendor/gapps/common/common-vendor.mk)
    ARROW_BUILD_ZIP_TYPE := gapps
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ARROW_VERSION := Arrow-$(ARROW_MOD_VERSION)_$(ARROW_TYPE)-$(CURRENT_DEVICE)-$(shell date -u +%Y%m%d)-$(ARROW_BUILD_ZIP_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.arrow.version=$(ARROW_VERSION) \
  ro.arrow.ziptype=$(ARROW_BUILD_ZIP_TYPE) \
  ro.modversion=$(ARROW_MOD_VERSION) \
  ro.arrow.type=$(ARROW_TYPE)

ARROW_DISPLAY_VERSION := Arrow-$(ARROW_MOD_VERSION)-$(ARROW_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.arrow.display.version=$(ARROW_DISPLAY_VERSION)

# System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.device.maintainer=$(DEVICE_MAINTAINER) \
  ro.device.maintainer_link=$(DEVICE_MAINTAINER_LINK)  
