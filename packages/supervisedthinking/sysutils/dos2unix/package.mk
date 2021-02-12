# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dos2unix"
PKG_VERSION="7.4.2"
PKG_SHA256="6035c58df6ea2832e868b599dfa0d60ad41ca3ecc8aa27822c4b7a9789d3ae01"
PKG_LICENSE="BSD-2-Clause-FreeBSD"
PKG_SITE="https://waterlan.home.xs4all.nl/dos2unix.html"
PKG_URL="https://waterlan.home.xs4all.nl/dos2unix/dos2unix-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="toolchain"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="DOS/Mac to Unix text file format converter"

makeinstall_host() {
  make prefix=${TOOLCHAIN} install-bin
}

makeinstall_target() {
  make prefix=${INSTALL} install-bin
}
