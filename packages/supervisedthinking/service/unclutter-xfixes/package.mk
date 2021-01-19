# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="unclutter-xfixes"
PKG_VERSION="9182d5e698a3c686d58938761371a590074f01a9"
PKG_SHA256="49629c00a90750603b3cc721d4b03db3fa78f16634c86f35a229379dea4c10a7"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/Airblader/unclutter-xfixes"
PKG_URL="https://github.com/Airblader/unclutter-xfixes/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libX11 libXi libXfixes libev-system"
PKG_LONGDESC="This is a rewrite of the popular tool unclutter, but using the x11-xfixes extension."

post_install() {
  enable_service unclutter.service
}
