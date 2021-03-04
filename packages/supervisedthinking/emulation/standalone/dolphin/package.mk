# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dolphin"
PKG_VERSION="be500a98e2befc1c0d5a80745ca9a8ec8ce1c31a" #5.0-13770
PKG_ARCH="x86_64"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/dolphin-emu/dolphin"
PKG_URL="https://github.com/dolphin-emu/dolphin.git"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd openal-soft-system libevdev curl ffmpeg libpng zlib bzip2 bluez pulseaudio alsa-lib libogg-system libvorbis-system libSM enet-system qt-everywhere unclutter-xfixes"
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC with improvements."
GET_HANDLER_SUPPORT="git"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-D DISTRIBUTOR=SupervisedThinking
                         -D USE_SHARED_ENET=on \
                         -D ENABLE_NOGUI=off \
                         -D ENABLE_LTO=off \
                         -D ENABLE_TESTS=off \
                         -D USE_DISCORD_PRESENCE=off \
                         -D ENABLE_ANALYTICS=off"
}

pre_make_target() {
  # fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed  -i "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
  
  # Export QT path
  export Qt5Gui_DIR=${SYSROOT_PREFIX}/usr/lib
}

post_makeinstall_target() {
  # Copy scripts & config files
  mkdir -p ${INSTALL}/usr/config/dolphin-emu
    cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
    cp -PR ${PKG_DIR}/config/* ${INSTALL}/usr/config/dolphin-emu/

  # Clean up
  safe_remove ${INSTALL}/usr/share/applications
  safe_remove ${INSTALL}/usr/share/icons
}

