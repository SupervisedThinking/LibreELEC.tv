# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="genesis-plus-gx"
PKG_VERSION="01cce8fc09d3b0746a0bdfc21387eec4d60a7ead"
PKG_SHA256="4b9f2d7cb7d4da9f05d75711bf00fbaaf4c22ff6c40ab3a65ebac49cb7c42a57"
PKG_LICENSE="Modified BSD / LGPL-2.1-or-later"
PKG_SITE="https://github.com/libretro/Genesis-Plus-GX"
PKG_URL="https://github.com/libretro/Genesis-Plus-GX/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="An enhanced port of Genesis Plus - accurate & portable Sega 8/16 bit emulator"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="genesis_plus_gx_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "${ARCH}" = "arm" ]; then
    CFLAGS+=" -DALIGN_LONG"
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
