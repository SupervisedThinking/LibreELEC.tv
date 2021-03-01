# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="emulationstation"
PKG_VERSION="be9e0f323ba67b8b18161397a0c739345d4d1936" #v2.9.4
PKG_LICENSE="ES"
PKG_SITE="https://github.com/RetroPie/EmulationStation"
PKG_URL="https://github.com/RetroPie/EmulationStation.git"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd dbus openssl zlib libpng alsa-lib sdl2 freetype curl freeimage bzip2 vlc carbon-es-theme pixel-es-theme simple-dark-es-theme"
PKG_LONGDESC="A Fork of Emulation Station which is a flexible emulator front-end supporting keyboardless navigation and custom system themes."
GET_HANDLER_SUPPORT="git"
PKG_GIT_CLONE_BRANCH="stable"
PKG_BUILD_FLAGS="+lto"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server unclutter-xfixes"
  fi

  # Add depends for OpenGL / OpenGLES support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

pre_configure_target() {
  # Build with OpenGL / OpenGLES support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+="-DGL=on"
  elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DGL=off \
                             -DGLES=on"
    if [ "${OPENGLES}" = "mesa" ]; then
      PKG_CMAKE_OPTS_TARGET+=" -DUSE_MESA_GLES=on"
    fi
  fi
}

post_makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}/etc/emulationstation
  mkdir -p ${INSTALL}/usr/config/emulationstation
  mkdir -p ${INSTALL}/usr/lib/tmpfiles.d

  # Create symlinks for themes & config files
  ln -s /usr/config/emulationstation/es_systems.cfg ${INSTALL}/etc/emulationstation/
  ln -s /usr/config/emulationstation/themes         ${INSTALL}/etc/emulationstation/themes

  # Install scripts
  cp -rf ${PKG_DIR}/scripts/*     ${INSTALL}/usr/bin/

  # Install resources
  cp -r ${PKG_DIR}/files/*     ${INSTALL}/usr/config/emulationstation/
  cp -a ${PKG_BUILD}/resources ${INSTALL}/usr/config/emulationstation/

  # Install ES config files
  cp ${PKG_DIR}/config/es_input.cfg          ${INSTALL}/usr/config/emulationstation/
  cp ${PKG_DIR}/config/es_settings.cfg       ${INSTALL}/usr/config/emulationstation/

  # Install ES system config files
  if [ ! -z ${DEVICE} ] && [ -d ${PKG_DIR}/config/device/${DEVICE} ]; then
    cp -v ${PKG_DIR}/config/device/${DEVICE}/es_systems.cfg                 ${INSTALL}/usr/config/emulationstation/
    cp -v ${PKG_DIR}/config/device/${DEVICE}/userdirs-emulationstation.conf ${INSTALL}/usr/lib/tmpfiles.d/
  else
    cp -v ${PKG_DIR}/config/${PROJECT}/es_systems.cfg                       ${INSTALL}/usr/config/emulationstation/
    cp -v ${PKG_DIR}/config/${PROJECT}/userdirs-emulationstation.conf       ${INSTALL}/usr/lib/tmpfiles.d/
  fi

  # clean up for KMS based ARM builds
  if [ ! "${DISPLAYSERVER}" = "x11" ]; then
    sed -e "/# Change refresh.*/,+2d" -i ${INSTALL}/usr/bin/*.start
  fi
}

