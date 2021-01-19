# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="moonlight-embedded"
PKG_VERSION="70e54ef300c60e9b91c24a174da9ebf3695d6e84" #v2.4.11
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/irtimmer/moonlight-embedded"
PKG_URL="https://github.com/irtimmer/moonlight-embedded.git"
PKG_DEPENDS_TARGET="toolchain alsa-lib avahi curl enet-system expat ffmpeg libcec libevdev pulseaudio openssl opus-system SDL2-system SDL_GameControllerDB systemd zlib speex"
PKG_LONGDESC="Moonlight Embedded is an open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield, but built for Linux."
GET_HANDLER_SUPPORT="git"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server unclutter-xfixes"
  fi

  if [ "${PROJECT}" = "RPi" ]; then
    PKG_DEPENDS_TARGET+=" bcm2835-driver"
  elif [ "${PROJECT}" = "Generic" ]; then
    PKG_DEPENDS_TARGET+=" libvdpau libxcb"
  fi
}

post_makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}/etc/moonlight
  mkdir -p ${INSTALL}/usr/config/moonlight
  mkdir -p ${INSTALL}/usr/share/moonlight

  # Copy config files
  ln -sf /usr/config/moonlight/moonlight.conf                  ${INSTALL}/etc/moonlight/
  ln -sf /usr/config/SDL-GameControllerDB/gamecontrollerdb.txt ${INSTALL}/usr/share/moonlight/
  ln -sf /usr/config/SDL-GameControllerDB/gamecontrollerdb.txt ${INSTALL}/usr/config/moonlight/
  cp -PR ${PKG_DIR}/config/*  ${INSTALL}/usr/config/moonlight/
  cp -PR ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/

  # Clean up
  safe_remove ${INSTALL}/usr/share
  safe_remove ${INSTALL}/usr/etc
}
