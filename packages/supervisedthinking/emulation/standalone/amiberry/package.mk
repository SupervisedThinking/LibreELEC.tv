# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="amiberry"
PKG_VERSION="77f9f926e9d25b6dde666bac08e5f4b68d3f9343" # v3.3
PKG_ARCH="arm"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/midwan/amiberry"
PKG_URL="https://github.com/midwan/amiberry.git"
PKG_DEPENDS_TARGET="toolchain linux glibc bzip2 zlib SDL2-system SDL2_image SDL2_ttf capsimg freetype libxml2 flac-system libogg-system mpg123-system libpng libmpeg2 retroarch-joypad-autoconfig"
PKG_LONGDESC="Amiberry is an optimized Amiga emulator for ARM-based boards."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="all"

pre_configure_target() {
  cd ${PKG_BUILD}
  export SDL2_CONFIG_PREFIX=${SYSROOT_PREFIX}/usr/bin

  case ${PROJECT} in
    Amlogic)
      if [ "${DEVICE}" = "AMLG12" ]; then
        AMIBERRY_PLATFORM="AMLG12B"
      else
        AMIBERRY_PLATFORM="AMLGX"
      fi
      ;;
    Rockchip)
      case "${DEVICE}" in
        RK3328)
          AMIBERRY_PLATFORM="RK3328"
        ;;
        RK3399)
          AMIBERRY_PLATFORM="RK3399"
        ;;
        MiQi|TinkerBoard)
          AMIBERRY_PLATFORM="RK3288"
        ;;
      esac
      ;;
    RPi)
      if [ "${DEVICE}" = "RPi2" ]; then
        AMIBERRY_PLATFORM="rpi2-sdl2"
      else
        AMIBERRY_PLATFORM="rpi1-sdl2"
      fi
      ;;
  esac

  PKG_MAKE_OPTS_TARGET+=" PLATFORM=${AMIBERRY_PLATFORM}"
}

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/lib
  mkdir -p ${INSTALL}/usr/config/amiberry/controller

  # Copy ressources
  cp -a ${PKG_DIR}/config/*           ${INSTALL}/usr/config/amiberry/
  cp -a data                          ${INSTALL}/usr/config/amiberry/
  cp -a savestates                    ${INSTALL}/usr/config/amiberry/
  cp -a screenshots                   ${INSTALL}/usr/config/amiberry/
  cp -a whdboot                       ${INSTALL}/usr/config/amiberry/
  ln -s /storage/roms/bios/Kickstarts ${INSTALL}/usr/config/amiberry/kickstarts

  # Create links to Retroarch controller files
  ln -s /usr/share/retroarch/autoconfig/udev/8Bitdo_Pro_SF30_BT_B.cfg "${INSTALL}/usr/config/amiberry/controller/8Bitdo SF30 Pro.cfg"
  ln -s "/usr/share/retroarch/autoconfig/udev/Pro Controller.cfg"     "${INSTALL}/usr/config/amiberry/controller/Pro Controller.cfg"

  # Copy binary, scripts & link libcapsimg
  cp -av amiberry-${AMIBERRY_PLATFORM} ${INSTALL}/usr/bin/amiberry
  cp -a ${PKG_DIR}/scripts/*           ${INSTALL}/usr/bin
  ln -sf /usr/lib/libcapsimage.so.5.1  ${INSTALL}/usr/config/amiberry/capsimg.so
}
