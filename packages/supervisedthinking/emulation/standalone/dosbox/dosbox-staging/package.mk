# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dosbox-staging"
PKG_VERSION="a827baa1b2cddd6cea166cafd6b597c568eac58d" #v0.76.0+ r4422
PKG_SHA256="853bf387b0e3da9262f44d3f9964d93f8b0dcff998fe499c5a5aa83f10bcce67"
PKG_LICENSE="GPL-2.0"
PKG_SITE="https://dosbox-staging.github.io/"
PKG_URL="https://github.com/dosbox-staging/dosbox-staging/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux alsa-lib SDL2-system SDL2_net opusfile libpng fluidsynth-system munt"
PKG_LONGDESC="DOSBox Staging is an attempt to revitalize DOSBox's development process. It's not a rewrite, but a continuation and improvement on the existing DOSBox codebase while leveraging modern development tools and practices."
PKG_TOOLCHAIN="autotools"
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
  # Clean up build directory
  cd ${PKG_BUILD}
  safe_remove .${TARGET_NAME}

  PKG_CONFIGURE_OPTS_TARGET="--with-sdl-prefix=${SYSROOT_PREFIX}/usr \
                             --enable-mt32 \
                             --enable-core-inline \
                             --enable-dynrec \
                             --enable-unaligned_memory"

  # Disable OpenGL if not supported
  if [ ! "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_CONFIGURE_OPTS_TARGET=" --disable-opengl"
  fi

  # Define target CPU arch
  case ${TARGET_CPU} in
    arm1176jzf-s)
      PKG_CONFIGURE_OPTS_TARGET+=" --host=armv6l"
      ;;
    cortex-a7|cortex-a9|*cortex-a53)
      PKG_CONFIGURE_OPTS_TARGET+=" --host=armv7l"
      ;;
    *)
      PKG_CONFIGURE_OPTS_TARGET+=" --host=${ARCH}"
      ;;
  esac
}

post_makeinstall_target() {
  # Create config directory & install config
  mkdir -p ${INSTALL}/usr/config/dosbox
  cp -a ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
  cp -a ${PKG_DIR}/config/*  ${INSTALL}/usr/config/dosbox/

  # Enable OpenGL output if supported
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    sed -e "s/output           = texture/output           = opengl/" -i ${INSTALL}/usr/config/dosbox/dosbox-staging*.conf
  fi
}
