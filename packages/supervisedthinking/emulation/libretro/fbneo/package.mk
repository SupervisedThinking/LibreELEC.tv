# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="fbneo"
PKG_VERSION="899a9f752d3270258b452f993e3d2f3a989e263a"
PKG_SHA256="78ffebb796dd0aa8d1821bd0fa2ae2eb27919fe6eb6a8b02f5eafd4e8a36b6ce"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/libretro/FBNeo"
PKG_URL="https://github.com/libretro/FBNeo/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="A libretro port of FinalBurn Neo for Romset v0.2.97.44"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto"

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
