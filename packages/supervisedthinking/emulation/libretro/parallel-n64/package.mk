# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="parallel-n64"
PKG_VERSION="6e26fbbc5a85f9613a01c1880142add81d618e19"
PKG_SHA256="9e88d2039bc7ccda0919f75b464c83b09f466aee4de215289c6b09e12da4756f"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/parallel-n64"
PKG_URL="https://github.com/libretro/parallel-n64/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Optimized/rewritten Nintendo 64 emulator made specifically for Libretro. Originally based on Mupen64 Plus."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-sysroot"

PKG_LIBNAME="parallel_n64_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7} WITH_DYNAREC=${ARCH}"

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
    if [ "${PROJECT}" = "RPi" ]; then
      case ${DEVICE} in
        RPi)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi"
          ;;
        RPi2)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
          ;;
      esac
    else
      if target_has_feature neon; then
        CFLAGS+=" -DGL_BGRA_EXT=0x80E1"
        PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
      fi
      if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
        PKG_MAKE_OPTS_TARGET+=" FORCE_GLES=1"
      fi
      PKG_MAKE_OPTS_TARGET+=" platform=armv"
    fi
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
