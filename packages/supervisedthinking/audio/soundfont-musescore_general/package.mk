# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="soundfont-musescore_general"
PKG_VERSION="0.2.0"
PKG_SHA256="657c0f2c84f503fc3d296baa105208654f6eaf19cad2526221a257766a374780"
PKG_LICENSE="MIT"
PKG_SITE="https://musescore.org/de/handbook/2/soundfonts-und-sfz-dateien"
PKG_URL="https://ftp.fau.de/gentoo/distfiles/53/MuseScore_General-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="This is a fork of FluidR3Mono_GM.sf2, with many samples (eventually) being replaced and/or reprogrammed."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/config/soundfonts
  mkdir -p ${INSTALL}/usr/share/soundfonts
    cp -v ${PKG_BUILD}/MuseScore_General.sf3 ${INSTALL}/usr/share/soundfonts/
    ln -sf /usr/share/soundfonts/MuseScore_General.sf3 ${INSTALL}/usr/config/soundfonts/
}
