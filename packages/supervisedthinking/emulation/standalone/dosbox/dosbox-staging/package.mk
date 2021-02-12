# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dosbox-staging"
PKG_VERSION="65ca80a9eca491f04e4fec47935c91e63dbf55d5" #v0.77.0-dev r4412 meson-branch
PKG_SHA256="72c2d88af5c8df78a2b4d0580f540d3106ca2a7a3f50583223614a6eab307b72"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://dosbox-staging.github.io/"
PKG_URL="https://github.com/dosbox-staging/dosbox-staging/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux alsa-lib sdl2 sdl2_net opusfile libpng fluidsynth-system munt"
PKG_LONGDESC="DOSBox Staging is an attempt to revitalize DOSBox's development process. It's not a rewrite, but a continuation and improvement on the existing DOSBox codebase while leveraging modern development tools and practices."
PKG_BUILD_FLAGS="+lto"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server unclutter-xfixes"
  fi

  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+="  ${OPENGL} dosbox-svn-shaders"
  fi
}

pre_configure_target() {
  PKG_MESON_OPTS_TARGET="--wrap-mode=nodownload"

  # Disable OpenGL if not supported
  if [ ! "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_MESON_OPTS_TARGET+=" -Duse_opengl=false"
  fi
}

post_makeinstall_target() {
  # Create config directory & install config
  mkdir -p ${INSTALL}/usr/config/dosbox
  cp -a ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
  cp -a ${PKG_DIR}/config/*  ${INSTALL}/usr/config/dosbox/

  # Clean-up
  safe_remove ${INSTALL}/usr/share

  # Enable OpenGL output if supported
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    sed -e "s/output           = texture/output           = opengl/"   -i ${INSTALL}/usr/config/dosbox/dosbox-staging*.conf
    sed -e "s/glshader           = none/glshader           = default/" -i ${INSTALL}/usr/config/dosbox/dosbox-staging*.conf
  fi
}
