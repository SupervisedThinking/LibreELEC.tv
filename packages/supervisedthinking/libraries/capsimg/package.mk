# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="capsimg"
PKG_VERSION="264973530f131f1de586dcf4346871ac633824a3"
PKG_SHA256="cf1cf13ed2dcc8b3ab091b814279952d36d5f1a597c88b2e51523be2abe97dc5"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/FrodeSolheim/capsimg"
PKG_URL="https://github.com/FrodeSolheim/capsimg/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="SPS Decoder Library 5.1 (formerly IPF Decoder Lib)"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-C CAPSImg"

pre_configure_target() {
  ./bootstrap.fs
  ./configure.fs --host=${TARGET_NAME}
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib
  cp -v  CAPSImg/libcapsimage.so.5.1 ${INSTALL}/usr/lib/
  ln -sf libcapsimage.so.5.1 ${INSTALL}/usr/lib/libcapsimage.so.5
  ln -sf libcapsimage.so.5.1 ${INSTALL}/usr/lib/libcapsimage.so
}
