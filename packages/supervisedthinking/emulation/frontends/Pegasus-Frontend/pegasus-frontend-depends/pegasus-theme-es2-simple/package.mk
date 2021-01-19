# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="pegasus-theme-es2-simple"
PKG_VERSION="1edfd7d766140a30f63bb8d439273761440e2cbd"
PKG_SHA256="ab79946f382e2126a644b5cac4e7c0042e6b2f72d5c442c3730e452e22c976e6"
PKG_LICENSE="CC-BY-4.0"
PKG_SITE="https://github.com/mmatyas/pegasus-theme-es2-simple"
PKG_URL="https://github.com/mmatyas/pegasus-theme-es2-simple/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ES2 Simple theme for Pegasus"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/pegasus-frontend/themes/pegasus-theme-es2-simple
  cp -a *  ${INSTALL}/usr/share/pegasus-frontend/themes/pegasus-theme-es2-simple
}
