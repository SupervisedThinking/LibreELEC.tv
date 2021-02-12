# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-core"
PKG_VERSION="af812317fe99c51184d02981939d147e73dd07cc"
PKG_SHA256="b98391abd0ce5af0c4afc00415bb45918d30a10ea4215047ef83883e122180e9"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-core"
PKG_URL="https://github.com/mupen64plus/mupen64plus-core/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain sdl2 freetype libpng zlib"
PKG_LONGDESC="Core module of the Mupen64Plus project"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+pic"

PKG_MAKE_OPTS_TARGET="-C projects/unix SRCDIR=../../src all NEW_DYNAREC=1 SHAREDIR=/usr/config/mupen64plus"

configure_package() {
  # Generic depends on nasm & glu
  if [ "${PROJECT}" = "Generic" ]; then
    PKG_DEPENDS_TARGET+=" nasm:host glu"
  fi
}

pre_configure_target() {
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}

  # ARCH arm
  if [ "${ARCH}" = "arm" ]; then
    PKG_MAKE_OPTS_TARGET+=" DYNAREC=arm HOST_CPU=armv7"

    # ARM NEON optimization
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+=" NEON=1"
    fi
  fi
  
  # build against GLESv2 instead of OpenGL
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_MAKE_OPTS_TARGET+=" USE_GLES=1"
    # RPi OpenGLES Features Support
    if [ "${OPENGLES}" = "bcm2835-driver" ]; then
      PKG_MAKE_OPTS_TARGET+=" VC=1"
    fi
  fi
}

makeinstall_target() {
  mv ${PKG_BUILD}/projects/unix/*.so* ${PKG_BUILD}/
}
