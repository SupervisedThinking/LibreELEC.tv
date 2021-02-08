# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dolphin"
PKG_VERSION="3e4bf57c696ed1e4f465075ae311653de2cd33b0" #5.0-13614
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/dolphin-emu/dolphin"
PKG_URL="https://github.com/dolphin-emu/dolphin.git"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd openal-soft-system libevdev curl ffmpeg libpng zlib bzip2 bluez pulseaudio alsa-lib libogg-system libvorbis-system libSM enet-system qt-everywhere unclutter-xfixes"
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC with improvements."
GET_HANDLER_SUPPORT="git"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DDISTRIBUTOR=SupervisedThinking
                         -DUSE_SHARED_ENET=on \
                         -DENABLE_NOGUI=off \
                         -DENABLE_LTO=off \
                         -DENABLE_TESTS=off \
                         -DUSE_DISCORD_PRESENCE=off \
                         -DENABLE_ANALYTICS=off"
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

