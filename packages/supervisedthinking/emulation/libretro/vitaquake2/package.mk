# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="vitaquake2"
PKG_VERSION="2d91b91c68c7d818be91cfc1f87e5b2a47b317d3"
PKG_SHA256="60e8aacc3641744c675017eef6a2bc1afc51eaedd9b515d3ec0dc4d9fcd8b41f"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/vitaquake2"
PKG_URL="https://github.com/libretro/vitaquake2/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Quake II port for PSVITA."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="vitaquake2_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

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

pre_configure_target() {
  # OpenGL support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_MAKE_OPTS_TARGET+=" HAVE_OPENGL=1"
  else
    PKG_MAKE_OPTS_TARGET+=" HAVE_OPENGL=0"
  fi

  if [ "${DEVICE}" = "RK3399" ]; then
    PKG_MAKE_OPTS_TARGET+=" platform=rockchip"
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
