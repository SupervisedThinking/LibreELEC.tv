# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="tinyalsa"
PKG_VERSION="2.0.0"
PKG_SHA256="573ae0b2d3480851c1d2a12503ead2beea27f92d44ed47b74b553ba947994ef1"
PKG_LICENSE="Apache-2.0"
PKG_SITE="https://github.com/tinyalsa/tinyalsa"
PKG_URL="https://github.com/tinyalsa/tinyalsa/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="TinyALSA is a small library to interface with ALSA in the Linux kernel."

PKG_MESON_OPTS_TARGET="-Ddocs=disabled \
                       -Dexamples=disabled \
                       -Dutils=disabled"
