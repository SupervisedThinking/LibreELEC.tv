# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mesen"
PKG_VERSION="0.9.9"
PKG_SHA256="8c638a9910b8de6cf628ceefb226c2f636e4397b0629f58a8ffb304984d68ea9"
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://github.com/NovaSquirrel/Mesen"
PKG_URL="https://github.com/NovaSquirrel/Mesen/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Mesen is a cross-platform (Windows & Linux) NES/Famicom emulator built in C++ and C#"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="mesen_libretro.so"
PKG_LIBPATH="Libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-C Libretro"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
