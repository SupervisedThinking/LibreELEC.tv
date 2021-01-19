# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="glsl-shaders-lr"
PKG_VERSION="bd6cc0c83858d52c214a25950555c6df151d02a0"
PKG_SHA256="30f19c1c52fa3a60465c3a6b7b919d39a9c8df66f377b94548f995207402a18d"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/glsl-shaders"
PKG_URL="https://github.com/libretro/glsl-shaders/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="gcc:host"
PKG_LONGDESC="GLSL shaders converted by hand from libretro's common-shaders repo."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="${INSTALL}/usr/share/retroarch/shaders/GLSL-Shaders"
}
