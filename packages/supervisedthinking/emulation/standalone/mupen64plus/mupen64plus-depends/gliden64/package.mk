# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gliden64"
PKG_VERSION="4_0"
PKG_SHA256="6b379cf109433527155b479d67a32c903bf074003907bea26de224a573501af6"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/gonetz/GLideN64"
PKG_URL="https://github.com/gonetz/GLideN64/archive/Public_Release_${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc freetype:host zlib bzip2 libpng"
PKG_LONGDESC="A new generation, open-source graphics plugin for N64 emulators."
PKG_TOOLCHAIN="cmake"
PKG_BUILD_FLAGS="-gold"

configure_package() {
  # Apply project specific patches
  PKG_PATCH_DIRS="${PROJECT}"

  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server unclutter-xfixes"
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
  PKG_CMAKE_SCRIPT="${PKG_BUILD}/src/CMakeLists.txt"

  PKG_CMAKE_OPTS_TARGET="-DVEC4_OPT=On \
                         -DCRC_OPT=On \
                         -DUSE_SYSTEM_LIBS=On \
                         -DMUPENPLUSAPI=On"

  # NEON Support
  if target_has_feature neon; then
    PKG_CMAKE_OPTS_TARGET+=" -DNEON_OPT=On"
  fi

  # Fix revision header
  PKG_REV_H=${PKG_BUILD}/src/Revision.h
  echo "#define PLUGIN_REVISION" ""\"${PKG_VERSION:0:10}""\"     > ${PKG_REV_H}
  echo "#define PLUGIN_REVISION_W" "L"\"${PKG_VERSION:0:10}""\" >> ${PKG_REV_H}

  # Remove outdated libpng & zlib headers
  safe_remove ${PKG_BUILD}/src/GLideNHQ/inc
}

makeinstall_target() {
 :
}
