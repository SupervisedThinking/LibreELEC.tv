# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

import subprocess
import xbmcaddon
import xbmcgui

dialog = xbmcgui.Dialog()
strings = xbmcaddon.Addon().getLocalizedString
cards = [c for c in subprocess.check_output(
    ['aplay', '-L']).decode('utf8').splitlines() if ':CARD=' in c]
if len(cards) == 0:
    dialog.ok(xbmcaddon.Addon().getAddonInfo('name'), strings(30020))
else:
    cardx = dialog.select(strings(30001), cards)
    if cardx != -1:
        xbmcaddon.Addon().setSetting('RR_AUDIO_DEVICE', cards[cardx])
