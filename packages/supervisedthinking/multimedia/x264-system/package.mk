# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="x264-system"
PKG_VERSION="d4099dd4c722f52c4f3c14575d7d39eb8fadb97f"
PKG_SHA256="9b6688b81e13cf342fc9b6b7adf1759eebd300c243c0707566ffe7ea9f0ccc7e"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org/developers/x264.html"
PKG_URL="http://repo.or.cz/x264.git/snapshot/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="x264 is a free library for encoding H264/AVC video streams."

if [ "${TARGET_ARCH}" = "x86_64" ]; then
  PKG_DEPENDS_TARGET+=" nasm:host"
fi

pre_configure_target() {
  cd ${PKG_BUILD}
  safe_remove .${TARGET_NAME}

  if [ "${TARGET_ARCH}" = "x86_64" ]; then
    export AS="${TOOLCHAIN}/bin/nasm"
    PKG_X264_LTO="--enable-lto"
  else
    PKG_X264_ASM="--disable-asm"
  fi
}

configure_target() {
  ./configure \
    --cross-prefix="${TARGET_PREFIX}" \
    --extra-cflags="${CFLAGS}" \
    --extra-ldflags="${LDFLAGS}" \
    --host="${TARGET_NAME}" \
    --prefix="/usr" \
    --sysroot="${SYSROOT_PREFIX}" \
    ${PKG_X264_ASM} \
    --disable-cli \
    ${PKG_X264_LTO} \
    --enable-pic \
    --enable-static \
    --enable-strip
}
