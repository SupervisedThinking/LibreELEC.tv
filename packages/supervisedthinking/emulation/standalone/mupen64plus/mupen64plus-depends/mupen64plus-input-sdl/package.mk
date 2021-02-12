# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-input-sdl"
PKG_VERSION="4015a8162a65dbfd9e07decd514f430f2dd0392a"
PKG_SHA256="cce09d8c725225d7c832d0615ba62aac85e775cab7ee009f2f108c27ae4c7b8e"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-input-sdl"
PKG_URL="https://github.com/mupen64plus/mupen64plus-input-sdl/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc sdl2 mupen64plus-core"
PKG_LONGDESC="Input plugin for Mupen64Plus v2.0 project using SDL. This is derived from the original Mupen64 blight_input plugin."
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="-f projects/unix/Makefile SRCDIR=src APIDIR=$(get_build_dir mupen64plus-core)/src/api all"

pre_configure_target() {
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}
}

makeinstall_target() {
 :
}
