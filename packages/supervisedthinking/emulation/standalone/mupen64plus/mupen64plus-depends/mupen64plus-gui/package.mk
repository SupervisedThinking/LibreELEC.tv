# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mupen64plus-gui"
PKG_VERSION="f454370d5d7d05e67317ac48fa45aefe0fdedf9f"
PKG_SHA256="050b72cbe429ce0c1930ddedfb9d3ba644b9995b2f5a5406d83f19e3247147c4"
PKG_LICENSE="GPL-3.0-or-later"
PKG_SITE="https://github.com/m64p/mupen64plus-gui"
PKG_URL="https://github.com/m64p/mupen64plus-gui/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc sdl2 qt-everywhere p7zip-system libpng zlib mupen64plus-core"
PKG_LONGDESC="mupen64plus GUI written in Qt5"
PKG_TOOLCHAIN="manual"

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

configure_target() {
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}
  echo "#define GUI_VERSION" \"${PKG_VERSION:0:7}\" > ${PKG_BUILD}/version.h
}

make_target() {
  mkdir -p ${PKG_BUILD}/.${TARGET_NAME}
  cd .${TARGET_NAME}
  qmake ${PKG_BUILD}/mupen64plus-gui.pro INCLUDEPATH="$(get_build_dir mupen64plus-core)/src/api"
  make -j${CONCURRENCY_MAKE_LEVEL}
}
