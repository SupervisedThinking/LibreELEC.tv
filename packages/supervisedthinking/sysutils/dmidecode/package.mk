# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dmidecode"
PKG_VERSION="3.3"
PKG_SHA256="82c737a780614c38a783e8055340d295e332fb12c7f418b5d21a0797d3fb1455"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL-1.0-or-later"
PKG_SITE="http://www.nongnu.org/dmidecode/"
PKG_URL="http://download.savannah.gnu.org/releases/dmidecode/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="dmidecode: report DMI information"

makeinstall_target() {
  make prefix=${INSTALL}/usr install-bin
}
