# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="adwaita-icon-theme"
PKG_VERSION="3.38.0"
PKG_SHA256="6683a1aaf2430ccd9ea638dd4bfe1002bc92b412050c3dba20e480f979faaf97"
PKG_LICENSE="LGPL-3.0"
PKG_SITE="https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
PKG_URL="https://download.gnome.org/sources/adwaita-icon-theme/${PKG_VERSION:0:4}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain gtk3-system hicolor-icon-theme librsvg"
PKG_LONGDESC="The Adwaita Icon Theme package contains an icon theme for Gtk+ 3 applications."
PKG_BUILD_FLAGS="-sysroot"

post_makeinstall_target() {
  ${PKG_ORIG_SYSROOT_PREFIX}/usr/bin/gtk-update-icon-cache ${INSTALL}/usr/share/icons/Adwaita
}
