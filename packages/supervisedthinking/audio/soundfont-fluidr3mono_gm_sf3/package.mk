# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="soundfont-fluidr3mono_gm_sf3"
PKG_VERSION="3.6.2"
PKG_SHA256="c37acc6d7a316f04925265d2d22a35d715888580e16eff846e9b621954133c45"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/musescore/MuseScore/tree/master/share/sound"
PKG_URL="https://github.com/musescore/MuseScore/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="This is a fork of FluidR3Mono_GM.sf2, with many samples (eventually) being replaced and/or reprogrammed."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/config/soundfonts
  mkdir -p ${INSTALL}/usr/share/soundfonts
    cp -v ${PKG_BUILD}/share/sound/FluidR3Mono_GM.sf3 ${INSTALL}/usr/share/soundfonts/
    ln -sf /usr/share/soundfonts/FluidR3Mono_GM.sf3 ${INSTALL}/usr/config/soundfonts/
}
