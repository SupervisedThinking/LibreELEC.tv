# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="spotify"
PKG_VERSION="latest"
PKG_ARCH="x86_64"
PKG_LICENSE="Freeware"
PKG_SITE="http://www.spotify.com"
PKG_DEPENDS_TARGET="toolchain gtk2 libX11 libICE-system libSM-system libcurl-gnutls freetype zlib unclutter-xfixes"
PKG_LONGDESC="A proprietary music streaming service"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # creating directories  
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/config/spotify

  # copy scripts, config files & resources
  cp ${PKG_DIR}/files/icon.png ${INSTALL}/usr/config/spotify/
  cp -rf ${PKG_DIR}/scripts/*  ${INSTALL}/usr/bin/
}
