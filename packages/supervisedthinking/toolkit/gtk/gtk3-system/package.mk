# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gtk3-system"
PKG_VERSION="3.24.24"
PKG_SHA256="55de8ae3233c9bc97d3d00fad9c53d18192624baaffa210679afec209333ab12"
PKG_LICENSE="LGPL-2.0-or-later"
PKG_SITE="http://www.gtk.org/"
PKG_URL="https://github.com/GNOME/gtk/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain at-spi2-atk atk cairo gdk-pixbuf glib libX11 libXi libXrandr libepoxy pango"
PKG_DEPENDS_CONFIG="libXft gdk-pixbuf"
PKG_LONGDESC="GTK is a multi-platform toolkit for creating graphical user interfaces."
PKG_TOOLCHAIN="meson"

PKG_MESON_OPTS_TARGET="-Dx11_backend=true \
                       -Dwayland_backend=false \
                       -Dquartz_backend=false \
                       -Dxinerama=no \
                       -Dprint_backends=auto \
                       -Dcolord=no \
                       -Dintrospection=false \
                       -Ddemos=false \
                       -Dexamples=false \
                       -Dtests=false \
                       -Dbuiltin_immodules=yes"

pre_configure_target() {
  # $TOOLCHAIN/bin/glib-compile-resources requires $TOOLCHAIN/lib/libffi.so.6
  export LD_LIBRARY_PATH="${TOOLCHAIN}/lib:${LD_LIBRARY_PATH}"
  export GLIB_COMPILE_RESOURCES=glib-compile-resources GLIB_MKENUMS=glib-mkenums GLIB_GENMARSHAL=glib-genmarshal
}

post_makeinstall_target() {
  # compile GSettings XML schema files
  ${TOOLCHAIN}/${TARGET_NAME}/sysroot/usr/bin/glib-compile-schemas ${INSTALL}/usr/share/glib-2.0/schemas

  # GTK basic theme configuration
  cp -PR ${PKG_DIR}/config/* ${INSTALL}/etc/gtk-3.0/
}