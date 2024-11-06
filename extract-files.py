#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_lib import (
    lib_fixups,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    "hardware/lge",
    "vendor/lge/sdm845-common",
    "vendor/qcom/opensource/display",
]

module = ExtractUtilsModule(
    'judyp',
    'lge',
    namespace_imports=namespace_imports,
    lib_fixups=lib_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'sdm845-common', module.vendor)
    utils.run()
