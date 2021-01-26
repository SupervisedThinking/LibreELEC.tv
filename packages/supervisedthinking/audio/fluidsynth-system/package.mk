# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="fluidsynth-system"
PKG_VERSION="2.1.6"
PKG_SHA256="328fc290b5358544d8dea573f81cb1e97806bdf49e8507db067621242f3f0b8a"
PKG_LICENSE="LGPL"
PKG_SITE="http://fluidsynth.org/"
PKG_URL="https://github.com/FluidSynth/fluidsynth/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain glib soundfont-generaluser"
PKG_LONGDESC="FluidSynth is a software real-time synthesizer based on the Soundfont 2 specifications."
PKG_BUILD_FLAGS="+pic"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DLIB_SUFFIX= \
                         -Denable-readline=0 \
                         -Denable-oss=0 \
                         -Denable-pulseaudio=1 \
                         -Denable-libsndfile=0"
}

post_makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}/etc/fluidsynth
  mkdir -p ${INSTALL}/usr/config/fluidsynth/soundfonts

  # Create symlinks & install config file
  cp -a ${PKG_DIR}/config/* ${INSTALL}/usr/config/fluidsynth/
  ln -s /storage/.config/fluidsynth/fluidsynth.conf ${INSTALL}/etc/fluidsynth/
  echo "Place your SoundFonts here!" >>             ${INSTALL}/usr/config/fluidsynth/soundfonts/readme.txt

  # Create symlink to SoundFont
  ln -s /usr/share/soundfonts/GeneralUser.sf2  ${INSTALL}/usr/config/fluidsynth/soundfonts/
}
