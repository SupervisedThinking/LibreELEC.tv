# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="pcsx2"
PKG_VERSION="cf33fb3ca1d6456949152b37e852ba5b8cbb6bed"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/PCSX2/pcsx2"
PKG_URL="https://github.com/PCSX2/pcsx2.git"
PKG_DEPENDS_TARGET="toolchain gdk-pixbuf libaio alsa-lib libfmt freetype gtk3-system glib mesa glew-cmake libpcap libpng pulseaudio systemd libX11 libxcb libxml2 SDL2-system soundtouch xz zlib pngpp yaml-cpp wxWidgets unclutter-xfixes adwaita-icon-theme hicolor-icon-theme"
PKG_LONGDESC="PCSX2 is a free and open-source PlayStation 2 (PS2) emulator. Its purpose is to emulate the PS2's hardware, using a combination of MIPS CPU Interpreters, Recompilers and a Virtual Machine which manages hardware states and PS2 system memory. This allows you to play PS2 games on your PC, with many additional features and benefits."
GET_HANDLER_SUPPORT="git"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_DOCDIR=/usr/share/doc \
                         -DCMAKE_INSTALL_DATADIR=/usr/share \
                         -DCMAKE_INSTALL_LIBDIR=/usr/lib \
                         -DDISABLE_ADVANCE_SIMD=ON \
                         -DDISABLE_BUILD_DATE=ON \
                         -DDISABLE_PCSX2_WRAPPER=ON \
                         -DENABLE_TESTS=OFF \
                         -DEXTRA_PLUGINS=ON \
                         -DSDL2_API=ON \
                         -DPACKAGE_MODE=ON \
                         -DREBUILD_SHADER=ON \
                         -DUSE_LTO=OFF \
                         -DUSE_SYSTEM_YAML=ON \
                         -DUSE_VTUNE=OFF \
                         -DXDG_STD=ON \
                         -Wno-dev"
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

post_makeinstall_target() {
  # create directories
  mkdir -p ${INSTALL}${INSTALL}/usr/config

  # fix permissions
  chmod +x ${INSTALL}/usr/lib/PCSX2/*

  # install scripts & config files
  cp -rfv ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
  cp -rfv ${PKG_DIR}/config/*  ${INSTALL}/usr/config

  # clean up
  safe_remove ${INSTALL}/usr/share/applications
  safe_remove ${INSTALL}/usr/share/pixmaps
}
