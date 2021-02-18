# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="pcsx2"
PKG_VERSION="4b722cc253e1605d633d2642fed186f8e9095853" #v1.7.0-dev+
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/PCSX2/pcsx2"
PKG_URL="https://github.com/PCSX2/pcsx2.git"
PKG_DEPENDS_TARGET="toolchain alsa-lib adwaita-icon-theme freetype gdk-pixbuf glew-cmake glib gtk3-system hicolor-icon-theme libaio libfmt libpcap libpng libX11 libxcb libxml2 mesa pngpp pulseaudio sdl2 soundtouch systemd wxwidgets xz yaml-cpp zlib unclutter-xfixes"
PKG_LONGDESC="PCSX2 is a free and open-source PlayStation 2 (PS2) emulator."
GET_HANDLER_SUPPORT="git"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DCMAKE_INSTALL_DOCDIR=/usr/share/doc \
                         -DCMAKE_INSTALL_DATADIR=/usr/share \
                         -DCMAKE_INSTALL_LIBDIR=/usr/lib \
                         -DDISABLE_ADVANCE_SIMD=ON \
                         -DDISABLE_PCSX2_WRAPPER=ON \
                         -DENABLE_TESTS=OFF \
                         -DSDL2_API=ON \
                         -DPACKAGE_MODE=ON \
                         -DUSE_LTO=ON \
                         -DREBUILD_SHADER=ON \
                         -DUSE_SYSTEM_YAML=ON \
                         -DUSE_VTUNE=OFF \
                         -DXDG_STD=ON \
                         -Wno-dev"
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed  -i "s:isystem :I:g" \{} \;
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
