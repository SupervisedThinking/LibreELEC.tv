# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gdk-pixbuf"
PKG_VERSION="2.42.2"
PKG_SHA256="83c66a1cfd591d7680c144d2922c5955d38b4db336d7cd3ee109f7bcf9afef15"
PKG_LICENSE="OSS"
PKG_SITE="http://www.gtk.org/"
PKG_URL="https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/${PKG_VERSION:0:4}/gdk-pixbuf-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain glib libjpeg-turbo libpng jasper shared-mime-info tiff libX11"
PKG_DEPENDS_CONFIG="shared-mime-info"
PKG_LONGDESC="GdkPixbuf is a a GNOME library for image loading and manipulation."

PKG_MESON_OPTS_TARGET="-Ddocs=false \
                       -Dgir=false \
                       -Dman=false \
                       -Drelocatable=false"

post_makeinstall_target() {
  cp ${PKG_DIR}/config/* ${INSTALL}/usr/lib/gdk-pixbuf-2.0/2.10.0/
}
