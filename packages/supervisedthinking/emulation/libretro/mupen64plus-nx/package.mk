# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-nx"
PKG_VERSION="8ef9dfeb8957ad08430e67f8ff41d3225f573053"
PKG_SHA256="f8d088c90438864090024cfc6257c339741911f739f9a73780862464314d0d4b"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro-nx"
PKG_URL="https://github.com/libretro/mupen64plus-libretro-nx/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib libpng"
PKG_LONGDESC="Mupen64Plus is mupen64plus + GLideN64 + libretro"
PKG_TOOLCHAIN="make"

if [ "${ARCH}" = "arm" ]; then
  PKG_BUILD_FLAGS="+lto"
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
  if [ "${PROJECT}" = "RPi" ]; then
    case ${DEVICE} in
      RPi)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi"
        ;;
      RPi2)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
        ;;
      RPi3)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi3"
        ;;
      RPi4)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi4"
        ;;
    esac
  elif [ "${PROJECT}" = "Amlogic" ]; then
    case ${DEVICE} in
      AMLG12)
        PKG_MAKE_OPTS_TARGET+=" platform=AMLG12B GLES=1"
        ;;
      AMLGX*)
        PKG_MAKE_OPTS_TARGET+=" platform=AMLGX"
        if [ "${OPENGLES}" = "mesa" ]; then
          PKG_MAKE_OPTS_TARGET+="-mesa"
        fi
        ;;
    esac
  elif [ "${PROJECT}" = "Rockchip" ]; then
    case ${DEVICE} in
      RK3328)
        PKG_MAKE_OPTS_TARGET+=" platform=RK3328"
        ;;
      RK3399)
        PKG_MAKE_OPTS_TARGET+=" platform=RK3399"
        ;;
      TinkerBoard|MiQi)
        PKG_MAKE_OPTS_TARGET+=" platform=RK3288"
        ;;
    esac
  else
    # OpenGLES 2.0/3.0 Support
    if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
      if [ "${OPENGLES}" = "libmali" ]; then
        PKG_MAKE_OPTS_TARGET+=" FORCE_GLES3=1"
      else
        PKG_MAKE_OPTS_TARGET+=" FORCE_GLES=1"
      fi
    fi
    # Dynarec
    if [ "${ARCH}" = "arm" ]; then
      PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=arm"
    elif [ "${ARCH}" = "x86_64" ]; then
      PKG_MAKE_OPTS_TARGET+=" WITH_DYNAREC=x86_64"
    fi
    # NEON Support
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
    fi
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
