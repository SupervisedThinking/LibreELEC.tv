# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="yquake2"
PKG_VERSION="6102a36" # v.7.45
PKG_SHA256="23de2f2989d3cdc37cfde4b876f33c92f28e5ecc364cdbbcf760b4bab2cd7b47"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://www.yamagi.org/quake2/"
PKG_URL="https://github.com/yquake2/yquake2/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain openal-soft-system SDL2-system"
PKG_LONGDESC="This is the Yamagi Quake II Client, an enhanced version of id Software's Quake II with focus on offline and coop gameplay."

PKG_CMAKE_OPTS_TARGET="-DSYSTEMWIDE_SUPPORT=yes"

makeinstall_target() {
 mkdir -p ${INSTALL}/usr/bin
 mkdir -p ${INSTALL}/usr/share/games/quake2
 mkdir -p ${INSTALL}/usr/config/games/yquake2/baseq2

 cp ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
 cp -r release/* ${INSTALL}/usr/share/games/quake2/
 cp ${PKG_BUILD}/stuff/yq2.cfg ${INSTALL}/usr/config/games/yquake2/baseq2/yq2.cfg

 ln -sf /usr/share/games/quake2/quake2 ${INSTALL}/usr/bin/quake2
 ln -sf /usr/config/games/yquake2/baseq2/yq2.cfg ${INSTALL}/usr/share/games/quake2/baseq2/yq2.cfg

 ln -sf /storage/roms/games/yquake2/baseq2/pak0.pak ${INSTALL}/usr/share/games/quake2/baseq2/pak0.pak
 ln -sf /storage/roms/games/yquake2/baseq2/pak1.pak ${INSTALL}/usr/share/games/quake2/baseq2/pak1.pak
 ln -sf /storage/roms/games/yquake2/baseq2/pak2.pak ${INSTALL}/usr/share/games/quake2/baseq2/pak2.pak
 ln -sf /storage/roms/games/yquake2/baseq2/pak2.pak ${INSTALL}/usr/share/games/quake2/baseq2/pak2.pak

 ln -s /storage/roms/games/yquake2/baseq2/video ${INSTALL}/usr/share/games/quake2/baseq2/video
 ln -s /storage/roms/games/yquake2/baseq2/music ${INSTALL}/usr/share/games/quake2/baseq2/music
 ln -s /storage/roms/games/yquake2/ctf ${INSTALL}/usr/share/games/quake2/ctf
 ln -s /storage/roms/games/yquake2/rogue ${INSTALL}/usr/share/games/quake2/rogue
 ln -s /storage/roms/games/yquake2/xatrix ${INSTALL}/usr/share/games/quake2/xatrix
}

