# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="sdl-jstest"
PKG_VERSION="aafbdb1ed3e687583037ba55ae88b1210d6ce98b" #v0.2.1+
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://gitlab.com/sdl-jstest/sdl-jstest"
PKG_URL="https://gitlab.com/sdl-jstest/sdl-jstest.git"
PKG_DEPENDS_TARGET="toolchain sdl2 sdl_gamecontrollerdb ncurses"
PKG_LONGDESC="Simple SDL joystick test application for the console"
GET_HANDLER_SUPPORT="git"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SDL_JSTEST=off"

post_makeinstall_target() {
  mv ${INSTALL}/usr/bin/sdl2-jstest ${INSTALL}/usr/bin/sdl2-jstest.bin
  cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
  ln -sf /usr/bin/sdl2-jstest ${INSTALL}/usr/bin/sdl-jstest

  # clean up
  safe_remove ${INSTALL}/usr/share
}
