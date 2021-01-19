# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="google-chrome"
PKG_VERSION="latest"
PKG_ARCH="x86_64"
PKG_LICENSE="Freeware"
PKG_SITE="http://www.google.com/chrome"
PKG_DEPENDS_TARGET="toolchain gtk3-system libXcomposite libXcursor libxss nss scrnsaverproto atk cups unclutter-xfixes"
PKG_LONGDESC="Google Chrome browser"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # creating directories
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/config/google-chrome
  mkdir -p ${INSTALL}/usr/share/applications
  mkdir -p ${INSTALL}/opt/google
  
  # copy scripts, config files & resources
  cp ${PKG_DIR}/config/chrome-flags.conf ${INSTALL}/usr/config/google-chrome/
  cp ${PKG_DIR}/config/mimeapps.list     ${INSTALL}/usr/share/applications/
  cp ${PKG_DIR}/files/icon.png           ${INSTALL}/usr/config/google-chrome/
  cp -rf ${PKG_DIR}/scripts/*            ${INSTALL}/usr/bin/

  # creating symlinks to working directories
  ln -s /storage/.cache/app.chrome/google-chrome.desktop ${INSTALL}/usr/share/applications/
  ln -s /storage/.cache/app.chrome                       ${INSTALL}/opt/google/chrome
}
