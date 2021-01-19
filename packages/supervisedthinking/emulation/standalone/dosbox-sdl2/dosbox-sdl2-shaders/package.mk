# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dosbox-sdl2-shaders"
PKG_VERSION="af99e21"
PKG_SHA256="538e06edd8a4fe3c31fe8a7b3da434e27b1786d974f2364a563a0371c9c5544e"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/duganchen/dosbox_shaders"
PKG_URL="https://github.com/duganchen/dosbox_shaders/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A collection of shaders for Dugan's DosBox Fork. Each shader is licensed under the same terms as the one it was ported from."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/dosbox/shaders
  cp *.vert $INSTALL/usr/config/dosbox/shaders/
  cp *.frag $INSTALL/usr/config/dosbox/shaders/
}
