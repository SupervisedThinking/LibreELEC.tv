# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="core-info-lr"
PKG_VERSION="ba14612c6ca860938adc03c64faae32291b1d2a1"
PKG_SHA256="81a8837affac28adfd18cbc0d8b8cec730e55228290d14e654386555c625fb57"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-core-info"
PKG_URL="https://github.com/libretro/libretro-core-info/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="gcc:host"
PKG_LONGDESC="Libretro's core info files"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="${INSTALL}/usr/share/retroarch/coreinfo"
}
