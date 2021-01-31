# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="vice"
PKG_VERSION="3.5"
PKG_SHA256="56b978faaeb8b2896032bd604d03c3501002187eef1ca58ceced40f11a65dc0e"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="http://vice-emu.sourceforge.net/"
PKG_URL="https://sourceforge.net/projects/vice-emu/files/releases/vice-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc alsa-lib sdl2 sdl2_image libpng giflib zlib portaudio libvorbis-system libogg-system lame-system flac-system unclutter-xfixes dos2unix:host"
PKG_LONGDESC="Versatile Commodore 8-bit Emulator"
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="+lto"

pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="ac_cv_prog_sdl2_config=${SYSROOT_PREFIX}/usr/bin/sdl2-config \
                             toolchain_check=no \
                           --prefix=/usr \
                           --enable-silent-rules \
                           --enable-native-tools=${HOST_CC} \
                           --enable-lame \
                           --enable-sdlui2 \
                           --enable-x64 \
                           --disable-catweasel \
                           --disable-hardsid \
                           --disable-option-checking \
                           --disable-parsid \
                           --disable-pdf-docs \
                           --with-flac \
                           --with-vorbis \
                           --with-sdlsound \
                           --without-alsa \
                           --without-pulse \
                           --without-oss"

  export LIBS="-ludev"
  ${PKG_BUILD}/autogen.sh
}

post_makeinstall_target() {
  # Copy start script
  cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin

  # Rename the lib directory as LE has a lib64 symlink to lib
  if [ -d ${INSTALL}/usr/lib64 ]; then
    mv ${INSTALL}/usr/lib64 ${INSTALL}/usr/lib
  fi

  # Copy default config
  mkdir -p ${INSTALL}/etc
  mkdir -p ${INSTALL}/usr/config/vice
  cp ${PKG_DIR}/config/sdl-vicerc ${INSTALL}/etc/
  cp ${PKG_DIR}/config/sdl-vicerc ${INSTALL}/usr/config/vice/

  # Remove binaries
  for bin in \
    c1541 \
    cartconv \
    petcat \
    vsid \
    x128 \
    x64dtv \
    x64sc \
    xcbm2 \
    xcbm5x0 \
    xpet \
    xplus4 \
    xscpu64 \
    xvic
  do
    safe_remove ${INSTALL}/usr/bin/${bin}
  done
}
