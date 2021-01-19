# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dosbox-libretro"
PKG_VERSION="aa71b67d54eaaf9e41cdd3cb5153d9cff0ad116e"
PKG_SHA256="5ed77ba6cc864ede7d2bdd51f36dc4b8f0adf77f7058fc3c7f8413f689222854"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/dosbox-libretro"
PKG_URL="https://github.com/libretro/dosbox-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of DOSBox (upstream) to the libretro API."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+pic"

configure_package() {
  if [  "${ARCH}" = "arm" ]; then
    PKG_BUILD_FLAGS+=" +lto"
  fi
}

PKG_LIBNAME="dosbox_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
