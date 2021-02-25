# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="carbon-es-theme"
PKG_VERSION="44dd673a5c6a4cc8c10f662e700b8d39e68da7f3"
PKG_SHA256="ee66978e49ca413a81c195cb7a8913df3bbbd00920bc5a120335507d3123187d"
PKG_LICENSE="CC-BY-NC-SA-2.0"
PKG_SITE="https://github.com/SupervisedThinking/es-theme-carbon/"
PKG_URL="https://github.com/SupervisedThinking/es-theme-carbon//archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Theme 'carbon' v2.4 - 08-16-2016 by Rookervik"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-sysroot"

PKG_MAKE_OPTS_TARGET="install DESTDIR=${INSTALL}"

post_makeinstall_target() {
  # Install stock theme
  ES_THEME_PATH=/usr/share/emulationstation/themes/carbon
  ES_CONFIG_PATH=/usr/config/emulationstation/themes
  mkdir -p ${INSTALL}/${ES_CONFIG_PATH}
    ln -s ${ES_THEME_PATH} ${INSTALL}/${ES_CONFIG_PATH}
}
