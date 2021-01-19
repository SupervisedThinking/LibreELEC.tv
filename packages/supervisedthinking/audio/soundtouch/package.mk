# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="soundtouch"
PKG_VERSION="2.2"
PKG_SHA256="b0019625ed0d53e27c2ce737b3382fcda2ce765f7492cd88d4ec23004e95d18c"
PKG_LICENSE="LGPL-2.1"
PKG_SITE="https://gitlab.com/soundtouch/soundtouch"
PKG_URL="https://gitlab.com/soundtouch/soundtouch/-/archive/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="SoundTouch audio tempo/pitch control library"
PKG_TOOLCHAIN="configure"

pre_configure_target() {
  ${PKG_BUILD}/bootstrap
}
