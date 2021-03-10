# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rr-config-tool"
PKG_VERSION="1.0"
PKG_REV="106"
PKG_ARCH="any"
PKG_LICENSE="GPL-2.0-or-later"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="LibreELEC-RR configuration tool"
PKG_LONGDESC="This addon provides a graphical interface to configure audio, video etc. for LibreELEC-RR extended builds."
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="RR Configuration"
PKG_ADDON_TYPE="xbmc.service.library"
PKG_MAINTAINER="SupervisedThinking"

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}/usr/share/${MEDIACENTER}/addons/${PKG_SECTION}.${PKG_NAME}
  mkdir -p ${INSTALL}/usr/share/${MEDIACENTER}/addons/${PKG_SECTION}.${PKG_NAME}/resources
 
  # Install files
  cp ${PKG_DIR}/icons/* ${INSTALL}/usr/share/${MEDIACENTER}/addons/${PKG_SECTION}.${PKG_NAME}/resources
  install_addon_files ${INSTALL}/usr/share/${MEDIACENTER}/addons/${PKG_SECTION}.${PKG_NAME}

  if [ ! "${PROJECT}" = "Generic" ]; then
    cp -rf ${PKG_DIR}/config/${PROJECT}/* ${INSTALL}/usr/share/${MEDIACENTER}/addons/${PKG_SECTION}.${PKG_NAME}
  fi
}
