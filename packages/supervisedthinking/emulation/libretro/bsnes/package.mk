# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="bsnes"
PKG_VERSION="bbbf6973b5cc868e9c69c4c60d08fb598ec1a3aa"
PKG_SHA256="e462b3bdf891d82229b2f67a05cb28906982de966a9ceac68d489a1511625d75"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/bsnes"
PKG_URL="https://github.com/libretro/bsnes/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="bsnes is a multi-platform Super Nintendo (Super Famicom) emulator that focuses on performance, features, and ease of use."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

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
