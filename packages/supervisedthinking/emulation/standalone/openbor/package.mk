# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="openbor"
PKG_VERSION="78764f054ee9ecac0d61cc359defcb23c2221dde" # 4.0-dev
PKG_LICENSE="BSD-3-Clause"
PKG_SITE="https://github.com/DCurrent/openbor"
PKG_URL="https://github.com/DCurrent/openbor.git"
PKG_DEPENDS_TARGET="toolchain glibc zlib libpng sdl2 libogg-system libvorbis-system libvpx-system"
PKG_LONGDESC="OpenBOR is the ultimate 2D side scrolling engine for beat em' ups, shooters, and more!"
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

pre_configure_target() {
  PKG_MAKE_OPTS_TARGET="BUILD_LINUX_LE_${ARCH}=1 \
                        -C ${PKG_BUILD}/engine \
                        SDKPATH="${SYSROOT_PREFIX}" \
                        PREFIX="${TARGET_NAME}-" \
                        LNXDEV="${TOOLCHAIN}/bin""
}

pre_make_target() {
  # Generate version.h
  cd ${PKG_BUILD}/engine
  ./version.sh
}

makeinstall_target() {
  # Install binary & start script
  mkdir -p ${INSTALL}/usr/bin
    cp -fv ${PKG_BUILD}/engine/OpenBOR ${INSTALL}/usr/bin/openbor
    cp -rfv ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin
  # Install default config cfg
  mkdir -p ${INSTALL}/usr/config/openbor
    cp -rfv ${PKG_DIR}/config/* ${INSTALL}/usr/config/openbor

  # clean up for KMS based ARM builds
  if [ ! "${DISPLAYSERVER}" = "x11" ]; then
    sed -e "/# Change refresh.*/,+2d" -i ${INSTALL}/usr/bin/*.start
  fi
}
