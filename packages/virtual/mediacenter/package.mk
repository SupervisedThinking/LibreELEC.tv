# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mediacenter"
PKG_VERSION=""
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain ${MEDIACENTER}"
PKG_SECTION="virtual"
PKG_LONGDESC="Mediacenter: Metapackage"

_add_binary_addon() {
  [ -f ${ROOT}/${PACKAGES}/mediacenter/kodi-binary-addons/$1/package.mk ] && PKG_DEPENDS_TARGET="${PKG_DEPENDS_TARGET} $1" || true
}

if [ "${MEDIACENTER}" = "kodi" ]; then
  PKG_DEPENDS_TARGET+=" ${MEDIACENTER}-theme-${SKIN_DEFAULT}"

  for i in ${SKINS}; do
    PKG_DEPENDS_TARGET+=" ${MEDIACENTER}-theme-${i}"
  done

# python-based tool for kodi management
  PKG_DEPENDS_TARGET+=" texturecache.py"

# some python stuff needed for various addons
  PKG_DEPENDS_TARGET="${PKG_DEPENDS_TARGET} Pillow \
                                          simplejson \
                                          pycryptodome"

# settings addon
  if [ -n "${DISTRO_PKG_SETTINGS}" ]; then
    PKG_DEPENDS_TARGET+=" ${DISTRO_PKG_SETTINGS}"
  fi

# other packages
  PKG_DEPENDS_TARGET+=" xmlstarlet"

  if [ "${JOYSTICK_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" peripheral.joystick"
  fi

  _ADDONS_PVR=yes
  _ADDONS_ADSP=no
  _ADDONS_GAME=no
  _ADDONS_OTHER=yes

  # various PVR clients
  if [ "${_ADDONS_PVR}" = "yes" ]; then
    _add_binary_addon "pvr.argustv"
    _add_binary_addon "pvr.demo"
    _add_binary_addon "pvr.dvblink"
    _add_binary_addon "pvr.dvbviewer"
    _add_binary_addon "pvr.filmon"
    _add_binary_addon "pvr.hts"
    _add_binary_addon "pvr.hdhomerun"
    _add_binary_addon "pvr.iptvsimple"
    _add_binary_addon "pvr.mediaportal.tvserver"
    _add_binary_addon "pvr.mythtv"
    _add_binary_addon "pvr.nextpvr"
    _add_binary_addon "pvr.njoy"
    _add_binary_addon "pvr.octonet"
    _add_binary_addon "pvr.pctv"
    _add_binary_addon "pvr.stalker"
    _add_binary_addon "pvr.teleboy"
    _add_binary_addon "pvr.vbox"
    _add_binary_addon "pvr.vdr.vnsi"
    _add_binary_addon "pvr.vuplus"
    _add_binary_addon "pvr.wmc"
    _add_binary_addon "pvr.zattoo"
  fi

  if [ "${_ADDONS_ADSP}" = "yes" ]; then
    _add_binary_addon "adsp.basic"
    _add_binary_addon "adsp.freesurround"
    _add_binary_addon "adsp.biquad.filters"
  fi

  if [ "${_ADDONS_GAME}" = "yes" ]; then
    _add_binary_addon "peripheral.steamcontroller"
    _add_binary_addon "game.libretro.2048"
    _add_binary_addon "game.libretro.beetle-bsnes"
    _add_binary_addon "game.libretro.beetle-gba"
    _add_binary_addon "game.libretro.beetle-pce-fast"
    _add_binary_addon "game.libretro.bluemsx"
    _add_binary_addon "game.libretro.bnes"
    _add_binary_addon "game.libretro.bsnes-mercury-accuracy"
    _add_binary_addon "game.libretro.bsnes-mercury-balanced"
    _add_binary_addon "game.libretro.bsnes-mercury-performance"
    _add_binary_addon "game.libretro.dosbox"
    _add_binary_addon "game.libretro.fceumm"
    _add_binary_addon "game.libretro.gambatte"
    _add_binary_addon "game.libretro.genplus"
    _add_binary_addon "game.libretro.mame"
    _add_binary_addon "game.libretro.meteor"
    _add_binary_addon "game.libretro.mgba"
    _add_binary_addon "game.libretro.mupen64plus"
    _add_binary_addon "game.libretro.nestopia"
    _add_binary_addon "game.libretro.pcsx-rearmed"
    _add_binary_addon "game.libretro.quicknes"
    _add_binary_addon "game.libretro.snes9x-next"
    _add_binary_addon "game.libretro.snes9x"
    _add_binary_addon "game.libretro.stella"
    _add_binary_addon "game.libretro.vba-next"
    _add_binary_addon "game.libretro.vbam"
    _add_binary_addon "game.libretro.yabause"
    _add_binary_addon "game.libretro"
  fi

  if [ "${_ADDONS_OTHER}" = "yes" ]; then
    _add_binary_addon "inputstream.adaptive"
    _add_binary_addon "inputstream.smoothstream"
    _add_binary_addon "inputstream.rtmp"
    _add_binary_addon "imagedecoder.raw"
    _add_binary_addon "vfs.libarchive"
    _add_binary_addon "vfs.rar"
  fi

  get_graphicdrivers
  if listcontains "${GRAPHIC_DRIVERS}" "(iris|i915|i965)"; then
    PKG_DEPENDS_TARGET+=" intel-vaapi-driver media-driver"
  fi

fi
