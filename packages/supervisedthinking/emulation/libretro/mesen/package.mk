# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mesen"
PKG_VERSION="70f1a1b600118fef2832f10f1dff67820a39490d" #0.9.9+
PKG_SHA256="d24c13c48397041ad24555735a7a470c82a2b647166cb9e95c290e354e7ea48f"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/NovaSquirrel/Mesen"
PKG_URL="https://github.com/NovaSquirrel/Mesen/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Mesen is a cross-platform (Windows & Linux) NES/Famicom emulator built in C++ and C#"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="mesen_libretro.so"
PKG_LIBPATH="Libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-C Libretro"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
