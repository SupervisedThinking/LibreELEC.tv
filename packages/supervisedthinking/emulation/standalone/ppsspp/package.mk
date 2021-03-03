# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="ppsspp"
PKG_VERSION="f7ace3b8ee33e97e156f3b07f416301e885472c5" #v1.11.3
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/hrydgard/ppsspp"
PKG_URL="https://github.com/hrydgard/ppsspp.git"
PKG_DEPENDS_TARGET="toolchain linux glibc sdl2 zlib ffmpeg bzip2 openssl speex"
PKG_LONGDESC="A PSP emulator for Android, Windows, Mac, Linux and Blackberry 10, written in C++."
GET_HANDLER_SUPPORT="git"
PKG_GIT_CLONE_BRANCH="v1.11-hotfixes"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server unclutter-xfixes"
  fi

  # Build with OpenGL / OpenGLES support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DUSE_SYSTEM_FFMPEG=ON"

  if [ "${PROJECT}" = "Generic" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DUSE_DISCORD=OFF"
  fi

  if [ "${ARCH}" = "arm" ] && [ ! "${TARGET_CPU}" = "arm1176jzf-s" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DARMV7=ON"
  elif [ "${TARGET_CPU}" = "arm1176jzf-s" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DARM=ON"
  fi

  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DUSING_GLES2=ON"
    if [ "${OPENGLES}" = "libmali" ]; then
      PKG_CMAKE_OPTS_TARGET+=" -DUSING_EGL=OFF"
    else
      PKG_CMAKE_OPTS_TARGET+=" -DUSING_FBDEV=ON \
                               -DUSING_EGL=ON"
    fi

    if [ "${OPENGLES}" = "mesa" ]; then
      CFLAGS+=" -DMESA_EGL_NO_X11_HEADERS"
      CXXFLAGS+=" -DMESA_EGL_NO_X11_HEADERS"
    fi
  fi

  if [ "${DISPLAYSERVER}" = "x11" ] && [ "${VULKAN_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DUSING_X11_VULKAN=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DUSING_X11_VULKAN=OFF"
  fi
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed  -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/share/PPSSPP
  mkdir -p ${INSTALL}/usr/config/ppsspp/PSP/SYSTEM

  # Install assets & binary
  cp -r assets ${INSTALL}/usr/share/PPSSPP
  cp PPSSPPSDL ${INSTALL}/usr/share/PPSSPP

  # Install scripts
  cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin

  # Install config
  cp ${PKG_DIR}/config/* ${INSTALL}/usr/config/ppsspp/PSP/SYSTEM
  if [ "${PROJECT}" = "Generic" ]; then
    sed -e "s/FullScreen = True/FullScreen = False/" -i ${INSTALL}/usr/config/ppsspp/PSP/SYSTEM/ppsspp.ini
  fi

  # clean up for KMS based ARM builds
  if [ ! "${DISPLAYSERVER}" = "x11" ]; then
    sed -e "/# Change refresh.*/,+2d" -i ${INSTALL}/usr/bin/*.start
  fi
}
