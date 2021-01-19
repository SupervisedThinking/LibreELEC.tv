# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="tinyalsa"
PKG_VERSION="69b9891f995450be8dd8f24dbd39cf1d417fac61"
PKG_SHA256="3c30e2ee32af81f6dfc1d1f396f9ee3309791ade2b29304e695eeb37669a8c76"
PKG_LICENSE="AOSP"
PKG_SITE="https://github.com/tinyalsa/tinyalsa"
PKG_URL="https://github.com/tinyalsa/tinyalsa/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="TinyALSA is a small library to interface with ALSA in the Linux kernel."

PKG_MESON_OPTS_TARGET="-Ddocs=disabled \
                       -Dexamples=disabled \
                       -Dutils=disabled"
