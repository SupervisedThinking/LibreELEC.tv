# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-rsp-cxd4"
PKG_VERSION="d4adb3d0ad53337a9985fd97ed0afcad417f6ccc"
PKG_SHA256="697d5acf02f44dc2a2551a84f429780512a1be0cf6b325c6e4f5dc0f445ea4ed"
PKG_LICENSE="CC0-1.0"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-rsp-cxd4"
PKG_URL="https://github.com/mupen64plus/mupen64plus-rsp-cxd4/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc sdl2 mupen64plus-core"
PKG_LONGDESC="Exemplary MSP communications simulator using a normalized VU."
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-f projects/unix/Makefile SRCDIR=. APIDIR=$(get_build_dir mupen64plus-core)/src/api all HLEVIDEO=1"

pre_configure_target() {
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}

  # ARCH arm
  if [ "${ARCH}" = "arm" ]; then
    PKG_MAKE_OPTS_TARGET+=" HOST_CPU=arm"
  fi
}

makeinstall_target() {
 :
}
