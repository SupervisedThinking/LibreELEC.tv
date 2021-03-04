# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="Generic"
PKG_VERSION="0.1"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://goo.gl/DcQtcR"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Metapackage for various LibreELEC-RR OEM packages"
PKG_TOOLCHAIN="manual"

################################################################################
# Setup packages included in Generic images
################################################################################

# Applications
OEM_APPLICATIONS_GENERIC=" \
  brave-browser \
  spotify"

# Libretro cores
OEM_EMULATORS_LIBRETRO_GENERIC=" \
  retroarch \
  2048 \
  atari800 \
  beetle-lynx \
  beetle-pce-fast \
  beetle-psx \
  beetle-saturn \
  beetle-wswan \
  bluemsx \
  bsnes \
  bsnes-mercury-accuracy \
  bsnes-mercury-balanced \
  boom3 \
  chailove \
  citra-libretro \
  desmume \
  dolphin-libretro \
  dosbox-pure \
  ecwolf \
  fbneo \
  fceumm \
  flycast \
  fuse-libretro \
  gambatte \
  genesis-plus-gx \
  genesis-plus-gx-wide \
  kronos \
  mame2003-plus \
  mame2016 \
  mesen \
  mgba \
  mrboom \
  mupen64plus-nx \
  nestopia \
  nside \
  opera \
  parallel-n64 \
  pcsx_rearmed \
  ppsspp-libretro \
  prboom \
  prosystem \
  sameboy \
  scummvm \
  snes9x \
  stella2014 \
  tyrquake \
  uae \
  vice-libretro \
  virtualjaguar \
  vitaquake2 \
  vitaquake3 \
  yabasanshiro"

# Standalone emulators
OEM_EMULATORS_STANDALONE_GENERIC=" \
  emulationstation \
  citra \
  dolphin \
  dosbox-staging \
  fs-uae \
  hatari \
  mupen64plus \
  openbor \
  pcsx2 \
  rpcs3 \
  ppsspp \
  vice"

# Frontends
OEM_FRONTENDS_EXTRA_GENERIC=" \
  pegasus-frontend"

# Streaming clients
OEM_STREAMING_CLIENTS_GENERIC=" \
  moonlight-qt" 

# Tools
OEM_TOOLS_GENERIC=" \
  dhrystone-benchmark \
  dmidecode \
  ds4drv \
  evtest \
  glmark2 \
  htop-system \
  lm-sensors \
  mesa-demos-system \
  midnight-commander \
  rr-config-tool \
  sdl-jstest \
  skyscraper \
  smartmontools \
  spectre-meltdown-checker \
  tigervnc-system \
  vulkan-tools"

################################################################################
# Install OEM packages to LibreELEC-RR
################################################################################

configure_package() {
  if [ "${OEM_SUPPORT}" = "yes" ]; then

    # Add application packages
    if [ "${OEM_APPLICATIONS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_APPLICATIONS_GENERIC}"
    fi

    # Add Emulationstation frontend & standalone emulator packages
    if [ "${OEM_EMULATORS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_STANDALONE_GENERIC}"
    fi

    # Add additional frontend packages
    if [ "${OEM_FRONTENDS_EXTRA}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_FRONTENDS_EXTRA_GENERIC}"
    fi

    # Add Retroarch frontend & libretro core packages 
    if [ "${OEM_LIBRETRO}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_LIBRETRO_GENERIC}"
    fi

    # Add streaming packages
    if [ "${OEM_STREAMING_CLIENTS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_STREAMING_CLIENTS_GENERIC}"
    fi

    # Add tool packages
    if [ "${OEM_TOOLS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_TOOLS_GENERIC}"
    fi
  fi
}

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}

  # Install OEM config files & scripts
  cp -PRv ${PKG_DIR}/config/* ${INSTALL}
}
