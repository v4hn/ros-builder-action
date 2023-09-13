#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

# shellcheck source=src/build.sh
source "${SRC_PATH}/build.sh"

gha_report_result "LATEST_PACKAGE" ""

FAIL_EVENTUALLY=0
build_all_sources

ici_log
ici_timed update_repo
ici_timed "ccache statistics" ccache -sv

if [ "$FAIL_EVENTUALLY" != 0 ]; then
	ici_exit 1 ici_color_output RED "Some packages failed to build"
fi
