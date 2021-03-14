# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="atari800"
PKG_VERSION="2f077a6e3afeccbc0fa9e5282dc351d736e172e0"
PKG_SHA256="d22217cbfa6ed224e6705695c114e39b33e1eceb009b57e032df39ac10862d36"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/libretro-atari800"
PKG_URL="https://github.com/libretro/libretro-atari800/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib"
PKG_LONGDESC="WIP Libretro port of Atari800 emulator version 3.1.0"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-sysroot"

PKG_LIBNAME="atari800_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
