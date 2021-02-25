# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gstreamer"
PKG_VERSION="1.18.3"
PKG_SHA256="0c2e09e18f2df69a99b5cb3bd53c597b3cc2e35cf6c98043bb86a66f3d312100"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://gstreamer.freedesktop.org"
PKG_URL="https://gstreamer.freedesktop.org/src/gstreamer/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="GStreamer open-source multimedia framework core library"

PKG_MESON_OPTS_TARGET="-Dlibunwind=disabled \
                       -Dgtk_doc=disabled \
                       -Dexamples=disabled \
                       -Dtests=disabled \
                       -Dnls=disabled"

post_makeinstall_target() {
  # clean up
  safe_remove ${INSTALL}/usr/share
}
