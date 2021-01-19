# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="lame-system"
PKG_VERSION="3.100"
PKG_SHA256="ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e"
PKG_LICENSE="LGPL"
PKG_SITE="http://lame.sourceforge.net/"
PKG_URL="${SOURCEFORGE_SRC}/lame/lame/3.100/lame-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A high quality MPEG Audio Layer III (MP3) encoder."
PKG_BUILD_FLAGS="-parallel +pic"

if [ "${TARGET_ARCH}" = "x86_64" ]; then
  PKG_DEPENDS_TARGET+=" nasm:host"
fi

pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="--disable-rpath \
                             --disable-cpml \
                             --disable-gtktest \
                             --disable-efence \
                             --disable-analyzer-hooks \
                             --enable-decoder \
                             --disable-frontend \
                             --disable-mp3x \
                             --disable-mp3rtp \
                             --disable-dynamic-frontends \
                             --enable-expopt=no \
                             --enable-debug=no \
                             --with-gnu-ld \
                             --with-fileio=lame \
                             GTK_CONFIG=no"

  if [ "${TARGET_ARCH}" = "x86_64" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-nasm"
  else
    PKG_CONFIGURE_OPTS_TARGET+=" --disable-nasm"
  fi
}
