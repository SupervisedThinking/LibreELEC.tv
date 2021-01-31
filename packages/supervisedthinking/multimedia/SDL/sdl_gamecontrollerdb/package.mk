# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="sdl_gamecontrollerdb"
PKG_VERSION="49abd3b88102de231cc51f80fe791219bb40c2ba"
PKG_SHA256="512fd4fb41093c7bf08feb9b330d18ab853a628828229f01f72224c6aa5d72e2"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/gabomdq/SDL_GameControllerDB"
PKG_URL="https://github.com/gabomdq/SDL_GameControllerDB/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="A community sourced database of game controller mappings to be used with SDL2 Game Controller functionality"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  PKG_INSTALL_PATH=${INSTALL}/usr/config/SDL-GameControllerDB
  mkdir -p ${PKG_INSTALL_PATH}
  cp -v gamecontrollerdb.txt ${PKG_INSTALL_PATH}
  # Clean up
  sed -e "/Windows/d" -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
  sed -e "/Mac/d"     -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
  sed -e "/Android/d" -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
  sed -e "/iOS/d"     -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
  sed -e "/^$/d"      -i ${PKG_INSTALL_PATH}/gamecontrollerdb.txt
}
