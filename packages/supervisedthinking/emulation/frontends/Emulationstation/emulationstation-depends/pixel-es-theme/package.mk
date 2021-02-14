# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="pixel-es-theme"
PKG_VERSION="ac5929d922c55bff913bf62f2cfaec9b8c896c72"
PKG_SHA256="c8e8e056e98fa963483f3abc6e7a6cabe78a087faa01654a6127639dd2b8aefe"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/SupervisedThinking/es-theme-pixel"
PKG_URL="https://github.com/SupervisedThinking/es-theme-pixel/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Emulationstation theme 'pixel' v2.1-dev"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="install DESTDIR=${INSTALL}"

post_makeinstall_target() {
  # Install stock theme
  ES_THEME_PATH=/usr/share/emulationstation/themes/pixel
  ES_CONFIG_PATH=/usr/config/emulationstation/themes
  mkdir -p ${INSTALL}/${ES_CONFIG_PATH}
    ln -s ${ES_THEME_PATH} ${INSTALL}/${ES_CONFIG_PATH}
}
