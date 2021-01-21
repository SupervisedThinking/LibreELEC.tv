# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="yuzu"
PKG_VERSION="4038ca2e5d247d37f781923e2fff6a41b5d92ae2"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://yuzu-emu.org"
PKG_URL="https://github.com/yuzu-emu/yuzu.git"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib libpng xorg-server boost-system qt-everywhere SDL2-system unclutter-xfixes"
PKG_LONGDESC="yuzu is an experimental open-source emulator for the Nintendo Switch"
GET_HANDLER_SUPPORT="git"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DYUZU_USE_BUNDLED_UNICORN=ON \
                         -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON"

  # Workaround for GCC 9.1.0 https://github.com/yuzu-emu/yuzu/issues/2597
  CXXFLAGS+=" -DFMT_USE_USER_DEFINED_LITERALS=0"
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed  -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

post_makeinstall_target() {
  # Copy scripts & config files
  # Copy scripts & config files
  mkdir -p ${INSTALL}/usr/config/yuzu
  cp -a  ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
  cp -PR ${PKG_DIR}/config/*  ${INSTALL}/usr/config/yuzu/
  cp -PR ${PKG_DIR}/files/*   ${INSTALL}/usr/config/yuzu/
  
  # Clean up
  safe_remove ${INSTALL}/usr/share/
  safe_remove ${INSTALL}/usr/bin/yuzu-cmd
  safe_remove ${INSTALL}/usr/bin/yuzu-tester
}
