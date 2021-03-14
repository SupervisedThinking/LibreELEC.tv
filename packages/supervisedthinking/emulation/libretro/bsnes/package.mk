# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="bsnes"
PKG_VERSION="1f27b4ae73146a481b37eed1df15930962538551"
PKG_SHA256="cf0dd3c3b219f94672213265f903d60433a494a56cc5cc0580f30f9f04806b6c"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/bsnes"
PKG_URL="https://github.com/libretro/bsnes/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="bsnes is a multi-platform Super Nintendo (Super Famicom) emulator that focuses on performance, features, and ease of use."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="bsnes_libretro.so"
PKG_LIBPATH="bsnes/out/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-C bsnes \
                      compiler=${TOOLCHAIN}/bin/${TARGET_NAME}-g++ \
                      target=libretro \
                      platform=linux \
                      binary=library \
                      openmp=false"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
