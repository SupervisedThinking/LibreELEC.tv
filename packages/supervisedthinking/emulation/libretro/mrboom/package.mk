# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mrboom"
PKG_VERSION="5ee93c663d8adec1e93f92d3b0a5b4920b01df2e" #v5.2
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Javanaise/mrboom-libretro"
PKG_URL="https://github.com/Javanaise/mrboom-libretro.git"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Mr.Boom is an 8 player Bomberman clone for RetroArch/Libretro"
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

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
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/config/retroarch/playlists
  mkdir -p ${INSTALL}/usr/lib/libretro

  #create Retroarch Playlist
  cp ${PKG_DIR}/files/*   ${INSTALL}/usr/config/retroarch/playlists
  cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin
  cp -v ${PKG_LIBPATH}    ${INSTALL}/usr/lib/libretro/
}
