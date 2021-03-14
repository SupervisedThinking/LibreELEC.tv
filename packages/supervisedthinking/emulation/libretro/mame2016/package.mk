# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mame2016"
PKG_VERSION="d53c379892b0bd91b4a52fc2de491e1199f03e32"
PKG_SHA256="bafcac133ff37fb3adeafd9960427e3314e682caf22d455395855d64553d46fe"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/mame2016-libretro"
PKG_URL="https://github.com/libretro/mame2016-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux:host alsa-lib"
PKG_LONGDESC="Late 2016 version of MAME (0.174) for libretro. Compatible with MAME 0.174 romsets."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-sysroot"

PKG_LIBNAME="mamearcade2016_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

pre_make_target() {
  PKG_MAKE_OPTS_TARGET=" \
    REGENIE=1 VERBOSE=1 NOWERROR=1 PYTHON_EXECUTABLE=python3 CONFIG=libretro \
    LIBRETRO_OS="unix" ARCH="" PROJECT="" LIBRETRO_CPU="${ARCH}" DISTRO="debian-stable" \
    CROSS_BUILD="1" OVERRIDE_CC="${CC}" OVERRIDE_CXX="${CXX}" \
    TARGET="mame" SUBTARGET="arcade" PLATFORM="${ARCH}" RETRO=1 OSD="retro" \
    GIT_VERSION=${PKG_VERSION:0:7}"

  if [ "${ARCH}" = "arm" ]; then
    PKG_MAKE_OPTS_TARGET+=" NOASM="1" ARCHITECTURE="""
  elif [ "${ARCH}" = "x86_64" ]; then
    PKG_MAKE_OPTS_TARGET+=" NOASM="0" PTR64="1""
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/mame2016_libretro.so
}
