# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="citra-libretro"
PKG_VERSION="6350013630303c62f4f213ef86c81a941f7781b2"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://github.com/libretro/citra"
PKG_URL="https://github.com/libretro/citra.git"
PKG_DEPENDS_TARGET="toolchain linux glibc boost-system"
PKG_LONGDESC="A Nintendo 3DS Emulator, running on libretro"
GET_HANDLER_SUPPORT="git"
PKG_BUILD_FLAGS="+lto"

PKG_LIBNAME="citra_libretro.so"
PKG_LIBPATH="src/citra_libretro/${PKG_LIBNAME}"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DENABLE_LIBRETRO=1 \
                         -DENABLE_SDL2=0 \
                         -DENABLE_QT=0 \
                         -DENABLE_WEB_SERVICE=0 \
                         -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
                         -DCMAKE_VERBOSE_MAKEFILE=1 \
                         --target citra_libretro"
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
