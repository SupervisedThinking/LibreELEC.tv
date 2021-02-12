# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="hicolor-icon-theme"
PKG_VERSION="0.17"
PKG_SHA256="317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d588a9d8"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://www.freedesktop.org/wiki/Software/icon-theme/"
PKG_URL="https://icon-theme.freedesktop.org/releases/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain gtk3-system"
PKG_LONGDESC="icon-theme contains the standard also references the default icon theme called hicolor."
PKG_BUILD_FLAGS="-sysroot"
