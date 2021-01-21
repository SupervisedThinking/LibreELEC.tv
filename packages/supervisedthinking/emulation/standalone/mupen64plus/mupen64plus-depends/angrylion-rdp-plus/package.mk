# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="angrylion-rdp-plus"
PKG_VERSION="3744ec766ed8d2c15fd5cbb4ac3c241b852b6e69" #v1.6
PKG_SHA256="a9a82b10320a9d0cca1923d38ffcdcd996a35926418c96e8f4497808a8da5a93"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/ata4/angrylion-rdp-plus"
PKG_URL="https://github.com/ata4/angrylion-rdp-plus/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc freetype zlib"
PKG_LONGDESC="A low-level N64 video emulation plugin, based on the pixel-perfect angrylion RDP plugin with some improvements."

makeinstall_target() {
 :
}
