# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="desmume"
PKG_VERSION="2ed78e2cece0bb9978fd64d37b17049ce2495c37"
PKG_SHA256="450bad42f90880ec759582c3b2f58af9cee6061965048e278c789cd9a70a43eb"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/desmume"
PKG_URL="https://github.com/libretro/desmume/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc libpcap"
PKG_LONGDESC="DeSmuME is a Nintendo DS emulator"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto -sysroot"

PKG_LIBNAME="desmume_libretro.so"
PKG_LIBPATH="desmume/src/frontend/libretro/${PKG_LIBNAME}"

# Disable OpenGL if not supported
if [ ! ${OPENGL_SUPPORT} = "yes" ]; then
  PKG_PATCH_DIRS="no-opengl"
fi

PKG_MAKE_OPTS_TARGET="-C desmume/src/frontend/libretro GIT_VERSION=${PKG_VERSION:0:7}"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi
}

pre_configure_target() {
  if [ "${ARCH}" = "arm" ]; then
    PKG_MAKE_OPTS_TARGET+=" platform=armv-${TARGET_FLOAT}float-${TARGET_CPU}"
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
