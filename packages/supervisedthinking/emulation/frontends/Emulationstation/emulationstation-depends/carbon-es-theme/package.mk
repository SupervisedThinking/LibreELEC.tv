# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="carbon-es-theme"
PKG_VERSION="03f8797ddf0dbac9880c67aa31d0e2038d32dacc"
PKG_SHA256="00122acec2e63f4e1520ae3507dae5df497309dcd7ba3afcaedd2a696cc1ee36"
PKG_LICENSE="CC-BY-NC-SA-2.0"
PKG_SITE="https://github.com/SupervisedThinking/es-theme-carbon/"
PKG_URL="https://github.com/SupervisedThinking/es-theme-carbon//archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Theme 'carbon' v2.4 - 08-16-2016 by Rookervik"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="install DESTDIR=${INSTALL}"

post_makeinstall_target() {
  # Install stock theme
  ES_THEME_PATH=/usr/share/emulationstation/themes/carbon
  ES_CONFIG_PATH=/usr/config/emulationstation/themes
  mkdir -p ${INSTALL}/${ES_CONFIG_PATH}
    ln -s ${ES_THEME_PATH} ${INSTALL}/${ES_CONFIG_PATH}
}
