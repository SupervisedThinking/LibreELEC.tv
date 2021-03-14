# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="sdl_gamecontrollerdb"
PKG_VERSION="1e335d8a9895014a807f668cb9c2233336ade8eb"
PKG_SHA256="405c740d0945ca6cb35b65b4847ca3904c94d33dfa2753ff969fa861d4e090cc"
PKG_LICENSE="SDL"
PKG_SITE="https://github.com/gabomdq/SDL_GameControllerDB"
PKG_URL="https://github.com/gabomdq/SDL_GameControllerDB/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="A community sourced database of game controller mappings to be used with SDL2 Game Controller functionality"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # Paths
  PKG_CONFIG_PATH="/usr/config/SDL-GameControllerDB"
  PKG_SHARE_PATH="/usr/share/sdl-gamecontrollerdb"
  PKG_DATABASE_PATH="${PKG_BUILD}/gamecontrollerdb.txt"

  # Clean up database
  sed -e "/Windows/d" -i ${PKG_DATABASE_PATH}
  sed -e "/Mac/d"     -i ${PKG_DATABASE_PATH}
  sed -e "/Android/d" -i ${PKG_DATABASE_PATH}
  sed -e "/iOS/d"     -i ${PKG_DATABASE_PATH}
  sed -e "/^$/d"      -i ${PKG_DATABASE_PATH}

  # Install files
  mkdir -p ${INSTALL}/${PKG_CONFIG_PATH}
  mkdir -p ${INSTALL}/${PKG_SHARE_PATH}
   cp -v ${PKG_DATABASE_PATH} ${INSTALL}/${PKG_SHARE_PATH}
   ln -sf ${PKG_SHARE_PATH}/gamecontrollerdb.txt ${INSTALL}/${PKG_CONFIG_PATH}/gamecontrollerdb.txt
}
