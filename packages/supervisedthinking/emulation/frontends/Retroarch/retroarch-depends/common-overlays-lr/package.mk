# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="common-overlays-lr"
PKG_VERSION="199019e120c321e667040c1a09ff9535e1547711"
PKG_SHA256="7ad6cf6a0e1adae269c3ba2997231489240012614168e5fabf541b3679650d52"
PKG_LICENSE="CC-BY-4.0 License"
PKG_SITE="https://github.com/libretro/common-overlays"
PKG_URL="https://github.com/libretro/common-overlays/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="Collection of overlay files for use with libretro frontends, such as RetroArch."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/retroarch/overlay
  cp -r ${PKG_BUILD}/borders ${INSTALL}/usr/share/retroarch/overlay
}
