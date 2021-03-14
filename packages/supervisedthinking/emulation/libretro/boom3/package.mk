# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="boom3"
PKG_VERSION="2cd22cb5b4ab8e6e14d54c108b53f2545a52d444"
PKG_SHA256="c2a9e942b6392243f8517a7b607c0942f3d63de0d3fb57230366bc51b5226ed1"
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://github.com/libretro/boom3"
PKG_URL="https://github.com/libretro/boom3/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="dhewm3 port to libretro."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="boom3_libretro.so"
PKG_LIBPATH="neo/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET=" -C neo GIT_VERSION=${PKG_VERSION:0:7}"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

pre_make_target() {
  cd $PKG_BUILD
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
