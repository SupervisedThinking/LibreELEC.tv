# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="pixel-es-theme"
PKG_VERSION="b3fc09ec3eeac449aa721ecc44d91da9dc4fd7fb"
PKG_SHA256="45ec8dde05c3d18f5c2dbdf65ab558a3c9e7a010b3f1821a07959ab3304de9d6"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/SupervisedThinking/es-theme-pixel"
PKG_URL="https://github.com/SupervisedThinking/es-theme-pixel/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Emulationstation theme 'pixel' v2.1-dev"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-sysroot"

PKG_MAKE_OPTS_TARGET="install DESTDIR=${INSTALL}"

post_makeinstall_target() {
  # Install stock theme
  ES_THEME_PATH=/usr/share/emulationstation/themes/pixel
  ES_CONFIG_PATH=/usr/config/emulationstation/themes
  mkdir -p ${INSTALL}/${ES_CONFIG_PATH}
    ln -s ${ES_THEME_PATH} ${INSTALL}/${ES_CONFIG_PATH}
}
