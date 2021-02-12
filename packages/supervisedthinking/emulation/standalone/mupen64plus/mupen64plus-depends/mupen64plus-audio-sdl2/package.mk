# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-audio-sdl2"
PKG_VERSION="4922bfa066c375a9b3f7957d38fb1ef04d9fe8f7"
PKG_SHA256="78caacbaa7f7bcf8d6c96a2728a8d15bf0bbc54bf08beaf583647529b6db60eb"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/m64p/mupen64plus-audio-sdl2"
PKG_URL="https://github.com/m64p/mupen64plus-audio-sdl2/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc mupen64plus-core libsamplerate sdl2"
PKG_LONGDESC="A low-level N64 video emulation plugin, based on the pixel-perfect angrylion RDP plugin with some improvements."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+pic"

PKG_MAKE_OPTS_TARGET="-f projects/unix/Makefile SRCDIR=src APIDIR=$(get_build_dir mupen64plus-core)/src/api all"

pre_configure_target() {
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}
}

makeinstall_target() {
 :
}
