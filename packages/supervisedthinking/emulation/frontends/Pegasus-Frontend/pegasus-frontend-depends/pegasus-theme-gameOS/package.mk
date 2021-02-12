# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="pegasus-theme-gameOS"
PKG_VERSION="03812b4e721ef81ed2f5d6437e45c6fc63ad0f3f" # v1.10
PKG_SHA256="391ab9137cdf816dddc9358b72828827b22eeb4cb8d9b57d518f0883712074a0"
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://github.com/PlayingKarrde/gameOS"
PKG_URL="https://github.com/PlayingKarrde/gameOS/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="gameOS theme for Pegasus Frontend"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/pegasus-frontend/themes/gameOS
  cp -a *  ${INSTALL}/usr/share/pegasus-frontend/themes/gameOS
}
