# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dosbox-pure"
PKG_VERSION="0.10"
PKG_SHA256="1bcc9cfb02afd1ceaf85e2030c696a3a641d3a2ef0f6988604f4a4959e38df20"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/schellingb/dosbox-pure"
PKG_URL="https://github.com/schellingb/dosbox-pure/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="DOSBox Pure is a fork of DOSBox, an emulator for DOS games, built for RetroArch/Libretro aiming for simplicity and ease of use."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS+="+lto"

PKG_LIBNAME="dosbox_pure_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
