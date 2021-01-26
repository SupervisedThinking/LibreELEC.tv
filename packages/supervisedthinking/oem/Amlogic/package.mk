# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="Amlogic"
PKG_VERSION="0.1"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://goo.gl/DcQtcR"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Metapackage for various LibreELEC-RR OEM packages"
PKG_TOOLCHAIN="manual"

################################################################################
# Setup packages included in Amlogic images
################################################################################

# Applications
OEM_APPLICATIONS_AMLOGIC=""

# Libretro cores 
OEM_EMULATORS_LIBRETRO_AMLOGIC=" \
  retroarch \
  2048 \
  atari800 \
  beetle-pce-fast \
  beetle-wswan \
  bluemsx \
  chailove \
  desmume \
  dosbox-libretro \
  dosbox-pure \
  fbneo \
  fceumm \
  flycast \
  fuse-libretro \
  gambatte \
  genesis-plus-gx \
  mame2003-plus \
  mame2010 \
  mame2016 \
  mesen \
  mgba \
  mrboom \
  mupen64plus-nx \
  nestopia \
  pcsx_rearmed \
  prboom \
  sameboy \
  scummvm \
  snes9x \
  snes9x2010 \
  stella2014 \
  tyrquake \
  vice-libretro \
  yabasanshiro \
  yabause"

# Standalone emulators
OEM_EMULATORS_STANDALONE_AMLOGIC=" \
  emulationstation \
  amiberry \
  dosbox-staging \
  hatari \

  openbor \
  ppsspp"

# Frontends
OEM_FRONTENDS_EXTRA_AMLOGIC=" \
  pegasus-frontend"

# Streaming clients
OEM_STREAMING_CLIENTS_AMLOGIC=" \
  moonlight-qt" 

# Tools
OEM_TOOLS_AMLOGIC=" \
  dhrystone-benchmark \
  ds4drv \
  htop \
  lm-sensors \
  midnight-commander \
  rr-config-tool \
  sdl-jstest \
  skyscraper \
  spectre-meltdown-checker \
  strace-system"

################################################################################
# Install OEM packages to LibreELEC-RR
################################################################################

configure_package() {
  if [ "${OEM_SUPPORT}" = "yes" ]; then

    # Add application packages
    if [ "${OEM_APPLICATIONS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_APPLICATIONS_AMLOGIC}"
    fi

    # Add Emulationstation frontend & standalone emulator packages
    if [ "${OEM_EMULATORS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_STANDALONE_AMLOGIC}"
    fi

    # Add additional frontend packages
    if [ "${OEM_FRONTENDS_EXTRA}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_FRONTENDS_EXTRA_AMLOGIC}"
    fi

    # Add Retroarch frontend & libretro core packages 
    if [ "${OEM_LIBRETRO}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_LIBRETRO_AMLOGIC}"
    fi

    # Add streaming packages
    if [ "${OEM_STREAMING_CLIENTS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_STREAMING_CLIENTS_AMLOGIC}"
    fi

    # Add tool packages
    if [ "${OEM_TOOLS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_TOOLS_AMLOGIC}"
    fi
  fi
}

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}

  # Install OEM config files & scripts
  cp -PRv ${PKG_DIR}/config/* ${INSTALL}
}
