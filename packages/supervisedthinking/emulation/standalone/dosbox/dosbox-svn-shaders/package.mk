# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="dosbox-svn-shaders"
PKG_VERSION="e8973b1da769a5ff5dc2423a5ae683b019747a4b"
PKG_SHA256="960a269150908bb1fd5c563dc9926ba6120201cd2710e2f300bb3f506b5e28ec"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/tyrells/dosbox-svn-shaders"
PKG_URL="https://github.com/tyrells/dosbox-svn-shaders/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="This repo contains a number of shaders ported/created for DOSBox-staging by members of the DOSBox community."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/config/dosbox/glshaders
  mkdir -p ${INSTALL}/usr/share/dosbox/glshaders
    cp -rv crt interpolation xbr ${INSTALL}/usr/share/dosbox/glshaders/
    ln -sf /usr/share/dosbox/glshaders/crt           ${INSTALL}/usr/config/dosbox/glshaders/
    ln -sf /usr/share/dosbox/glshaders/interpolation ${INSTALL}/usr/config/dosbox/glshaders/
    ln -sf /usr/share/dosbox/glshaders/xbr           ${INSTALL}/usr/config/dosbox/glshaders/
}
