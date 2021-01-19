# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gst-plugins-base"
PKG_VERSION="1.18.2"
PKG_SHA256="dd04fb1f7826e2f6d9b4d66fc22f19cc6a47c301e13041f0ee3d7f65c89b05ac"
PKG_LICENSE="GPL"
PKG_SITE="https://gstreamer.freedesktop.org/modules/gst-plugins-base.html"
PKG_URL="https://gstreamer.freedesktop.org/src/gst-plugins-base/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain gstreamer"
PKG_LONGDESC="Base GStreamer plugins and helper libraries"
PKG_BUILD_FLAGS="-gold"

pre_configure_target() {
  PKG_MESON_OPTS_TARGET="-Dexamples=disabled \
                         -Dtests=disabled \
                         -Dgtk_doc=disabled \
                         -Dnls=disabled"

  # Fix undefined symbol glPointSizePointerOES
  if [ "${OPENGLES}" = "bcm2835-driver" ]; then
    TARGET_LDFLAGS+=" -lEGL -lGLESv2"
  fi
}

post_makeinstall_target(){
  # Clean up
  safe_remove ${INSTALL}/usr/bin
}
