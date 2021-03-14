# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="prboom"
PKG_VERSION="29592dc40ded230a65dff4bc9d1c2a0bd7e2b139"
PKG_SHA256="1b9ed491cf903a945415fb67a383253138d9ff66f053903f9e13606ac4ed31f7"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/libretro-prboom"
PKG_URL="https://github.com/libretro/libretro-prboom/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of prboom to libretro - plays Doom, Doom II, Final Doom and other Doom IWAD mods."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="prboom_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  mkdir -p ${INSTALL}/usr/share/prboom

  cp ${PKG_BUILD}/prboom.wad ${INSTALL}/usr/share/prboom
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}

