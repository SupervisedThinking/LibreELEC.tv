# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-ui-console"
PKG_VERSION="32e27344214946f0dce3cd2b4fff152a3538bd8f"
PKG_SHA256="7d4a0a71545caec19d007f34038cffaee36b75d27de615cd4e175bb5ab2e227d"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-ui-console"
PKG_URL="https://github.com/mupen64plus/mupen64plus-ui-console/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc sdl2 mupen64plus-core"
PKG_LONGDESC="Console (command-line) front-end user interface for Mupen64Plus v2.0 project"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-f projects/unix/Makefile \
                      SRCDIR=src \
                      APIDIR=$(get_build_dir mupen64plus-core)/src/api \
                      SHAREDIR=/usr/config/mupen64plus \
                      COREDIR=/usr/lib/mupen64plus/ \
                      PLUGINDIR=/usr/lib/mupen64plus/ \
                      all"

pre_configure_target() {
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}
}

makeinstall_target() {
 :
}
