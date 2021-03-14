# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-nx"
PKG_VERSION="9ae6f16bb9c75f2d2f2fa2fc4fd001cf7dda6d95"
PKG_SHA256="e091b58b322266bc8873662de40c67285ce84c57e1da4f0f46660b9c64cf66a2"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro-nx"
PKG_URL="https://github.com/libretro/mupen64plus-libretro-nx/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib libpng"
PKG_LONGDESC="Mupen64Plus is mupen64plus + GLideN64 + libretro"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-sysroot"

if [ "${ARCH}" = "arm" ]; then
  PKG_BUILD_FLAGS+=" +lto"
fi

PKG_LIBNAME="mupen64plus_next_libretro.so"
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
  # Set project specific platform flags
  case ${PROJECT} in
    Amlogic)
      PKG_MAKE_OPTS_TARGET+=" platform=${DEVICE}"
      ;;
    RPi)
      case ${DEVICE} in
        RPi)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi"
          ;;
        RPi2)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
          ;;
        RPi4)
          PKG_MAKE_OPTS_TARGET+=" platform=rpi4"
          ;;
      esac
      ;;
    Rockchip)
      PKG_MAKE_OPTS_TARGET+=" platform=${DEVICE}"
      ;;
    *)
      # Arch ARM
      if [ "${ARCH}" = "arm" ]; then
        PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=arm platform=armv"
        # NEON Support
        if target_has_feature neon; then
          PKG_MAKE_OPTS_TARGET+="-neon"
        fi
      fi

      # OpenGL ES Support
      if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
        PKG_MAKE_OPTS_TARGET+=" FORCE_GLES3=1"
      fi
      # Dynarec x86_64    
      if [ "${ARCH}" = "x86_64" ]; then
        PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=x86_64"
      fi
    ;;
  esac
  # Fix Mesa 3D based OpenGL ES builds
  if [ "${OPENGLES}" = "mesa" ]; then
    PKG_MAKE_OPTS_TARGET+="-mesa"
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
