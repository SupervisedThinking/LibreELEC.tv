# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mesa-demos-system"
PKG_VERSION="8.4.0"
PKG_SHA256="84338ce936fa110232a62bcd36c7c2c8710c4a280e9a81c4d10d06f6c2506b7d"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="http://www.mesa3d.org/"
PKG_URL="https://gitlab.freedesktop.org/mesa/demos/-/archive/mesa-demos-${PKG_VERSION}/demos-mesa-demos-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libX11 mesa glew-cmake"
PKG_LONGDESC="Mesa 3D demos - installed are the well known glxinfo and glxgears."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--without-glut"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
   cp -v src/xdemos/glxinfo  ${INSTALL}/usr/bin
   cp -v src/xdemos/glxgears ${INSTALL}/usr/bin
}
