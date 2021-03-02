# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="genesis-plus-gx-wide"
PKG_VERSION="ac7c50fe865b7f485eda982a41dbe4ea9edcfc33"
PKG_SHA256="b2c1e60f9b786b7adabb4da84c1ef3dbd77685f39d953c1cabc5ac8ea691157a"
PKG_LICENSE="Modified BSD / LGPLv2.1"
PKG_SITE="https://github.com/libretro/Genesis-Plus-GX-Wide"
PKG_URL="https://github.com/libretro/Genesis-Plus-GX-Wide/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Widescreen modification of Genesis Plus GX"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="genesis_plus_gx_wide_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "${ARCH}" = "arm" ]; then
    CFLAGS+=" -DALIGN_LONG"
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
