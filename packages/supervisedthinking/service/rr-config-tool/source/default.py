# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

import subprocess
import xbmcaddon
import xbmcgui

subprocess.call("systemd-run /bin/sh /usr/share/kodi/addons/service.rr-config-tool/bin/rr-config-tool.start", shell=True)
