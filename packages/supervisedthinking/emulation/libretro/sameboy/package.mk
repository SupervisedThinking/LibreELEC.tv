# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="sameboy"
PKG_VERSION="907cb965baa3ae6e60469ddfbd82798988fa2a9c"
PKG_SHA256="bf654725b146a74565f739154ca1d6a51b7e914487c073f850caf9c35ea6323c"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/SameBoy"
PKG_URL="https://github.com/libretro/SameBoy/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Gameboy and Gameboy Color emulator written in C"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="sameboy_libretro.so"
PKG_LIBPATH="libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET=" -C libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
