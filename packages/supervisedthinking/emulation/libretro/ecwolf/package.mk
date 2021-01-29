# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="ecwolf"
PKG_VERSION="78dcd233bb548406511401bbaed74b05ad59fdd6"
PKG_SHA256="b3e996b0ed2a1cb528946b9292504eff363c78a6b1315386e38632e10f1e8bf8"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/ecwolf"
PKG_URL="https://github.com/libretro/ecwolf/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Libretro port of ECWolf"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="ecwolf_libretro.so"
PKG_LIBPATH="src/libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET=" -C src/libretro GIT_VERSION=${PKG_VERSION:0:7}"

pre_make_target() {
  cd $PKG_BUILD
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
