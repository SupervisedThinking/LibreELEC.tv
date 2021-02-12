# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="libev-system"
PKG_VERSION="4.33"
PKG_SHA256="d6b41df38df2a7ced84e3dd14e3c34afd1c893f67af0086977973f51c4986214"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="http://libev.schmorp.de"
PKG_URL="https://git.lighttpd.net/mirrors/libev/archive/rel-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A full-featured and high-performance event loop."
PKG_TOOLCHAIN="configure"

pre_configure_target() {
  do_autoreconf
}
