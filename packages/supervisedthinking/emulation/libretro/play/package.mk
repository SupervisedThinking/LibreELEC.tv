# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="play"
PKG_VERSION="884ae3b96c631f235cd18b2643d1f318fa6951fb"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/Play-"
PKG_URL="https://github.com/libretro/Play-.git"
PKG_DEPENDS_TARGET="toolchain zlib bzip2"
PKG_LONGDESC="Play! is an attempt to create a PlayStation 2 emulator."
GET_HANDLER_SUPPORT="git"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="play_libretro.so"
PKG_LIBPATH="Source/ui_libretro/${PKG_LIBNAME}"

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
  PKG_CMAKE_OPTS_TARGET="-DBUILD_PLAY=off \
                         -DBUILD_TESTS=no \
                         -DBUILD_LIBRETRO_CORE=yes \
                         -DCMAKE_BUILD_TYPE=Release \
                         --target play_libretro"

  if [ "${OPENGLES_SUPPORT}" = "yes" ] && [ "${OPENGL_SUPPORT}" = "no" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DUSE_GLES=yes"
  fi
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
