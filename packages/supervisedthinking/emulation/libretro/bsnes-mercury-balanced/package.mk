# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="bsnes-mercury-balanced"
PKG_VERSION="4a382621da58ae6da850f1bb003ace8b5f67968c"
PKG_SHA256="9f9989fbda41164647b1d0ea59bab7108b0ad83778f682275e9eb666b07549cc"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/bsnes-mercury"
PKG_URL="https://github.com/libretro/bsnes-mercury/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Fork of bsnes with various performance improvements."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="bsnes_mercury_balanced_libretro.so"
PKG_LIBPATH="out/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="profile=balanced GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
