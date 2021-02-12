# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="fs-uae"
PKG_VERSION="e2d255ab459aa3dfc0356fc08b83022d71f17d1b" # 3.0.4
PKG_SHA256="aca44e11b36de3d63b10123c36f4017da3cd6fc0cd9e264489ba47566920975c"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://github.com/FrodeSolheim/fs-uae"
PKG_URL="https://github.com/FrodeSolheim/fs-uae/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc glib sdl2 glew-cmake libmpeg2 libXi openal-soft-system capsimg zlib libpng"
PKG_LONGDESC="FS-UAE amiga emulator."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+lto"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server unclutter-xfixes"
  fi
}

post_unpack() {
  # Copy custom input configs
  cp -rf ${PKG_DIR}/input/* ${PKG_BUILD}/share/fs-uae/input/
}

pre_configure_target() {
  # Fix cross compiling
  export ac_cv_func_realloc_0_nonnull=yes
}

post_makeinstall_target() {
  # Install scripts
  cp -rfv ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/

  # Set up default config directory
  mkdir -p ${INSTALL}/usr/config
  cp -rfv ${PKG_DIR}/config ${INSTALL}/usr/config/fs-uae
  ln -sf /storage/roms/bios/Kickstarts ${INSTALL}/usr/config/fs-uae/Kickstarts

  # Create symlink to capsimg for IPF support
  mkdir -p ${INSTALL}/usr/config/fs-uae/Plugins
  ln -sf /usr/lib/libcapsimage.so.5.1 ${INSTALL}/usr/config/fs-uae/Plugins/capsimg.so

  # Clean up
  safe_remove ${INSTALL}/usr/share/applications
  safe_remove ${INSTALL}/usr/share/icons
  safe_remove ${INSTALL}/usr/share/mime
}
