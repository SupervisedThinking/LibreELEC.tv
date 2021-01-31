# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="moonlight-qt"
PKG_VERSION="dbfdc2fd149ea4ae9558b6d971674d2b158b7aa9" # v3.0.0+
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/moonlight-stream/moonlight-qt"
PKG_URL="https://github.com/moonlight-stream/moonlight-qt.git"
PKG_DEPENDS_TARGET="toolchain linux openssl alsa-lib pulseaudio ffmpeg SDL2-system SDL2_ttf qt-everywhere opus-system"
PKG_LONGDESC="Moonlight is an open source implementation of NVIDIA's GameStream."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server unclutter-xfixes"
  fi
}

configure_target() {
  # Create working dir
  mkdir -p ${PKG_BUILD}/.${TARGET_NAME}
  cd .${TARGET_NAME}

  # Generate qmake config
  qmake ${PKG_BUILD}/moonlight-qt.pro PREFIX=${INSTALL}/usr
}

post_makeinstall_target() {
  mv ${INSTALL}/usr/bin/moonlight ${INSTALL}/usr/bin/moonlight-qt
  cp -rfv ${PKG_DIR}/scripts/*    ${INSTALL}/usr/bin/
  safe_remove ${INSTALL}/usr/share

 if [ ${DISPLAYSERVER} = "no" ]; then
   sed -e "s/set_QT_environment_vars.*/set_QT_environment_vars cursor/" -i ${INSTALL}/usr/bin/moonlight-qt.start
 fi
}
