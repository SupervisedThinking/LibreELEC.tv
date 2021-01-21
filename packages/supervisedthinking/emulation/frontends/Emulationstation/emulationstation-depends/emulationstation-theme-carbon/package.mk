# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="emulationstation-theme-carbon"
PKG_VERSION="b09973e"
PKG_SHA256="d100082afdfb32bbcd130b6236cbcbb544ed6e2ded7982144329672f54ab0f55"
PKG_LICENSE="CC-BY-NC-SA-2.0"
PKG_SITE="https://github.com/RetroPie/es-theme-carbon"
PKG_URL="https://github.com/RetroPie/es-theme-carbon/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Theme 'carbon' v2.4 - 08-16-2016 by Rookervik"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # Install stock theme
  ES_THEME_PATH=/usr/share/emulationstation/themes/carbon
  mkdir -p ${INSTALL}/usr/config/emulationstation/themes
  mkdir -p ${INSTALL}/${ES_THEME_PATH}
  cp -r *  ${INSTALL}/${ES_THEME_PATH}
  ln -s    ${ES_THEME_PATH} ${INSTALL}/usr/config/emulationstation/themes/carbon

  # Add missing common systems
  cp -a ${PKG_DIR}/files/2048      ${INSTALL}/${ES_THEME_PATH}/
  cp -a ${PKG_DIR}/files/chailove  ${INSTALL}/${ES_THEME_PATH}/
  cp -a ${PKG_DIR}/files/mrboom    ${INSTALL}/${ES_THEME_PATH}/
  cp -a ${PKG_DIR}/files/moonlight ${INSTALL}/${ES_THEME_PATH}/
  cp -a ${PKG_DIR}/files/openbor   ${INSTALL}/${ES_THEME_PATH}/
  cp -a ${PKG_DIR}/files/prboom    ${INSTALL}/${ES_THEME_PATH}/
  cp -a ${PKG_DIR}/files/tyrquake  ${INSTALL}/${ES_THEME_PATH}/

  # Add missing generic systems
  if [ "${PROJECT}" = "Generic" ]; then
    cp -a ${PKG_DIR}/files/n3ds    ${INSTALL}/${ES_THEME_PATH}/
    cp -a ${PKG_DIR}/files/ps3     ${INSTALL}/${ES_THEME_PATH}/
  fi
}
