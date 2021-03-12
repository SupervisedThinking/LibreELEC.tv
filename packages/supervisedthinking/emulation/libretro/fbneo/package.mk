# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="fbneo"
PKG_VERSION="ac99b2ab1e7793b255f1bb410804a80deed473b0"
PKG_SHA256="774b5b9935fc7f8b1b118fee1062eb19d1f1a9780b8e8af160407735a82f6d66"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/libretro/FBNeo"
PKG_URL="https://github.com/libretro/FBNeo/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="A libretro port of FinalBurn Neo for Romset v1.0.0.1"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-gold +lto"

PKG_LIBNAME="fbneo_libretro.so"
PKG_LIBPATH="src/burner/libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-C src/burner/libretro/ GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "${ARCH}" = "arm" ]; then
    PKG_MAKE_OPTS_TARGET+=" platform=armv"

    # NEON Support ?
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+="-neon"
    fi
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
