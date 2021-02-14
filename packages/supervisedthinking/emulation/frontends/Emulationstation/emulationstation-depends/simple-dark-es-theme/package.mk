# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="simple-dark-es-theme"
PKG_VERSION="058472cfbc3b4fe9ddf1ab452908fab40e32d29c"
PKG_SHA256="8e58972134d54cf202109c240452c65f1672ece7cd7955a549b272bea3963094"
PKG_LICENSE="CC-BY-NC-SA-2.0"
PKG_SITE="https://github.com/RetroPie/es-theme-simple-dark"
PKG_URL="https://github.com/RetroPie/es-theme-simple-dark/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Simple dark theme for Emulationstation based on Theme 'simple' v1.3 - 11-29-2014"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # Install stock theme
  ES_THEME_PATH=/usr/share/emulationstation/themes/simple-dark
  mkdir -p ${INSTALL}/usr/config/emulationstation/themes
  mkdir -p ${INSTALL}/${ES_THEME_PATH}
  cp -r *  ${INSTALL}/${ES_THEME_PATH}
  ln -s    ${ES_THEME_PATH} ${INSTALL}/usr/config/emulationstation/themes/simple-dark

  # Add missing generic systems
  if [ "${PROJECT}" = "Generic" ]; then
    cp -a ${PKG_DIR}/files/n3ds ${INSTALL}/${ES_THEME_PATH}/
  fi

  # Add scroll sound to menu 
  cp ${PKG_DIR}/files/scroll.wav ${INSTALL}/${ES_THEME_PATH}/art/
}
