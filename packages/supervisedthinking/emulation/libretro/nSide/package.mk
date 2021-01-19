# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="nSide"
PKG_VERSION="5e965d0db4c0d05e7e8fb6449035538781c73473"
PKG_SHA256="353a3c4643bf9a7c777c2def95d41d10f5407ce68d61522946e52c1494d8f8bb"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/nSide"
PKG_URL="https://github.com/libretro/nSide/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="A fork of higan v106 that reimplements the Balanced profile."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="higan_sfc_balanced_libretro.so"
PKG_LIBPATH="out/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-f GNUmakefile compiler=${TOOLCHAIN}/bin/${TARGET_NAME}-g++ target=libretro platform=linux binary=library"

pre_make_target() {
  cd ${PKG_BUILD}/nSide
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
