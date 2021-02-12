# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="tigervnc-system"
PKG_VERSION="1.10.1"
PKG_SHA256="19fcc80d7d35dd58115262e53cac87d8903180261d94c2a6b0c19224f50b58c4"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="http://www.tigervnc.org"
PKG_URL="https://github.com/TigerVNC/tigervnc/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libX11 libXdamage libXext libXtst zlib libjpeg-turbo"
PKG_LONGDESC="TigerVNC server"

PKG_CMAKE_OPTS_TARGET="-DBUILD_VIEWER=off \
                       -Wno-dev"

post_makeinstall_target() {
  # copy config
  mkdir -p ${INSTALL}/usr/config/tigervnc
    cp ${PKG_DIR}/config/vncpasswd ${INSTALL}/usr/config/tigervnc/

  # clean up
  safe_remove ${INSTALL}/usr/bin/vncserver
  safe_remove ${INSTALL}/usr/bin/vncconfig
}
