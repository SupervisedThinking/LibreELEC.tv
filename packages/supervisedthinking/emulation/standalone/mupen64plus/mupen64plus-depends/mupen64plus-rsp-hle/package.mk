# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-rsp-hle"
PKG_VERSION="e653930d75019f88dd386a3d534008d89dbc12ff"
PKG_SHA256="b2b91a108f69fb360a477e801a28d8557b9cebfeb0103814a4fa7db37a0257ed"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-rsp-hle"
PKG_URL="https://github.com/mupen64plus/mupen64plus-rsp-hle/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc sdl2 mupen64plus-core"
PKG_LONGDESC="RSP processor plugin for the Mupen64Plus v2.0 project. This plugin is based on the Mupen64 HLE RSP plugin v0.2 with Azimers code by Hacktarux"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-f projects/unix/Makefile SRCDIR=src APIDIR=$(get_build_dir mupen64plus-core)/src/api all"

pre_configure_target() {
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}

  # ARCH arm
  if [ "${ARCH}" = "arm" ]; then
    PKG_MAKE_OPTS_TARGET+=" DYNAREC=arm HOST_CPU=arm"
  fi
}

makeinstall_target() {
 :
}
