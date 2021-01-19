# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="pngpp"
PKG_VERSION="0.2.10"
PKG_SHA256="998af216ab16ebb88543fbaa2dbb9175855e944775b66f2996fc945c8444eee1"
PKG_LICENSE="BSD"
PKG_SITE="https://savannah.nongnu.org/projects/pngpp/"
PKG_URL="https://download.savannah.nongnu.org/releases/pngpp/png++-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libpng"
PKG_LONGDESC="PNG++ aims to provide simple yet powerful C++ interface to libpng, the PNG reference implementation library."

pre_configure_target() {
  LDFLAGS+=" -lz"
  sed "s/0.2.9/${PKG_VERSION}/g" -i ${PKG_BUILD}/Makefile
}

makeinstall_target() {
  make PREFIX=${SYSROOT_PREFIX}/usr install
}

