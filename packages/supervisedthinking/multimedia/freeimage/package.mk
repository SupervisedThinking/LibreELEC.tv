# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="freeimage"
PKG_VERSION="3180"
PKG_SHA256="f41379682f9ada94ea7b34fe86bf9ee00935a3147be41b6569c9605a53e438fd"
PKG_LICENSE="GPLv3"
PKG_SITE="http://freeimage.sourceforge.net/"
PKG_URL="${SOURCEFORGE_SRC}/${PKG_NAME}/FreeImage${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain"
PKG_SOURCE_DIR="FreeImage"
PKG_LONGDESC="FreeImage is a library to support graphics image formats like PNG, BMP, JPEG, TIFF and other."

pre_configure_target() {
  # Workaround for missing ARM NEON in LibPNG source files
  if target_has_feature neon; then
    CFLAGS+=" -DPNG_ARM_NEON_OPT=0"
  fi
}