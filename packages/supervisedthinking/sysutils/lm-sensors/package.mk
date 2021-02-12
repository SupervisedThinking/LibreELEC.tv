# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="lm-sensors"
PKG_VERSION="3-6-0"
PKG_SHA256="0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197"
PKG_ARCH="arm x86_64"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/lm-sensors/lm-sensors"
PKG_URL="https://github.com/${PKG_NAME}/${PKG_NAME}/archive/V${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The lm-sensors package, version 3, provides user-space support for the hardware monitoring drivers in Linux 2.6.5 and later."
PKG_TOOLCHAIN="make"

PKG_MAKEINSTALL_OPTS_TARGET="ARCH="${ARCH}" PREFIX=/usr"

pre_make_target() {
  PKG_MAKE_OPTS_TARGET="PREFIX=/usr CC=${CC} AR=${AR}"

  export CFLAGS="${TARGET_CFLAGS}"
  export CPPFLAGS="${TARGET_CPPFLAGS}"
}
