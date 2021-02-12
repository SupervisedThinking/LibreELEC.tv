# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="glsl-shaders-lr"
PKG_VERSION="24728b95220155a6282048e43caf7567fb863eed"
PKG_SHA256="3ba58caab0d5aa252f5fc0e5d1474137f2b3a9ef337a9734705bce3a7614889a"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/glsl-shaders"
PKG_URL="https://github.com/libretro/glsl-shaders/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="gcc:host"
PKG_LONGDESC="GLSL shaders converted by hand from libretro's common-shaders repo."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="${INSTALL}/usr/share/retroarch/shaders/GLSL-Shaders"
}
