# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="enet-system"
PKG_VERSION="1.3.16"
PKG_SHA256="b3aa85b43e4309fec9441b4e6639c268e22962a578bd5e2307bb3a7b6fe73714"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/lsalzman/enet/"
PKG_URL="https://github.com/lsalzman/enet/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A network communication layer on top of UDP (User Datagram Protocol)."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"

post_makeinstall_target() {
  safe_remove ${INSTALL}
}
