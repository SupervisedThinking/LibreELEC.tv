# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

import xbmcgui
import subprocess

dialog = xbmcgui.Dialog()
dialog.ok('', 'Updating the beta key. Check out /var/log/MakeMKV.log for further information. Otherwise this is a console-only addon.')
subprocess.call("systemd-run /storage/.kodi/addons/lib.multimedia.makemkv/bin/makemkv-key-update", shell=True)
