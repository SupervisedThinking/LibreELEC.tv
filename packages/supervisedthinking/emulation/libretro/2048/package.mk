# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="2048"
PKG_VERSION="57f401f40dc34def95027e3727dcb4c274bcabb3"
PKG_SHA256="21df9fb853f5f8f1f6ca8d2170fb0f78137989e9ae29212ff4a3ea5453bd15e4"
PKG_LICENSE="Public domain"
PKG_SITE="https://github.com/libretro/libretro-2048"
PKG_URL="https://github.com/libretro/libretro-2048/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of 2048 puzzle game to the libretro API."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="2048_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/config/retroarch/playlists
  mkdir -p ${INSTALL}/usr/lib/libretro

  #create Retroarch Playlist
  cp ${PKG_DIR}/files/*   ${INSTALL}/usr/config/retroarch/playlists
  cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin
  cp ${PKG_LIBPATH}       ${INSTALL}/usr/lib/libretro/
}
