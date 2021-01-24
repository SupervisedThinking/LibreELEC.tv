# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="brave-browser"
PKG_VERSION="latest"
PKG_ARCH="x86_64"
PKG_LICENSE="MPL-2.0"
PKG_SITE="https://brave.com"
PKG_DEPENDS_TARGET="toolchain gtk3-system libXcomposite libXcursor libxss nss scrnsaverproto atk cups unclutter-xfixes"
PKG_LONGDESC="Web browser that blocks ads and trackers by default"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # creating directories
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/config/BraveSoftware/Brave-Browser
  mkdir -p ${INSTALL}/usr/share/applications
  mkdir -p ${INSTALL}/opt/brave.com
  
  # copy scripts, config files & resources
  cp ${PKG_DIR}/config/mimeapps.list    ${INSTALL}/usr/share/applications/
  cp ${PKG_DIR}/config/brave-flags.conf ${INSTALL}/usr/config/BraveSoftware/Brave-Browser
  cp ${PKG_DIR}/files/brave-icon.png    ${INSTALL}/usr/config/BraveSoftware/Brave-Browser
  cp -rf ${PKG_DIR}/scripts/*           ${INSTALL}/usr/bin/

  # creating symlinks to working directories
  ln -s /storage/.cache/app.brave-browser/brave-browser.desktop ${INSTALL}/usr/share/applications/
  ln -s /storage/.cache/app.brave-browser                       ${INSTALL}/opt/brave.com/brave
  ln -s /usr/bin/brave-browser.start                            ${INSTALL}/usr/bin/brave-browser-stable
}
