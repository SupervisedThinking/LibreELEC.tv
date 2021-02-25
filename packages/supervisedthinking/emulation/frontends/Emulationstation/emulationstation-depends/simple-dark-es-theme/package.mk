# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="simple-dark-es-theme"
PKG_VERSION="e4fd1d56dbcdd9b3273eaa5f252edd88718197be"
PKG_SHA256="040b63bf178604e9ee0a4a9cbb0ff9950e5553edd037ef29699d2a8f9d45846d"
PKG_LICENSE="CC-BY-NC-SA-2.0"
PKG_SITE="https://github.com/SupervisedThinking/es-theme-simple-dark"
PKG_URL="https://github.com/SupervisedThinking/es-theme-simple-dark/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Simple dark theme for Emulationstation based on Theme 'simple' v1.3 - 11-29-2014"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-sysroot"

PKG_MAKE_OPTS_TARGET="install DESTDIR=${INSTALL}"

post_makeinstall_target() {
  # Install stock theme
  ES_THEME_PATH=/usr/share/emulationstation/themes/simple-dark
  ES_CONFIG_PATH=/usr/config/emulationstation/themes
  mkdir -p ${INSTALL}/${ES_CONFIG_PATH}
    ln -s ${ES_THEME_PATH} ${INSTALL}/${ES_CONFIG_PATH}
}
