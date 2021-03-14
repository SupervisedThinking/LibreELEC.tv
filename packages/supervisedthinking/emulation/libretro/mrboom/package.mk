# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mrboom"
PKG_VERSION="67a20a4ac0dff6d3285f7fe8d563919b8f875609" #v5.2
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://github.com/Javanaise/mrboom-libretro"
PKG_URL="https://github.com/Javanaise/mrboom-libretro.git"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Mr.Boom is an 8 player Bomberman clone for RetroArch/Libretro"
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="mrboom_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  # Disable NEON otherwise build fails
  if target_has_feature neon; then
    PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/config/retroarch/playlists
  mkdir -p ${INSTALL}/usr/lib/libretro

  #create Retroarch Playlist
  cp ${PKG_DIR}/config/*   ${INSTALL}/usr/config/retroarch/playlists
  cp -v ${PKG_LIBPATH}    ${INSTALL}/usr/lib/libretro/
}
