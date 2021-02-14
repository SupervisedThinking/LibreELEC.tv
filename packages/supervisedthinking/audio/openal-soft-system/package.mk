# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="openal-soft-system"
PKG_VERSION="1.21.1"
PKG_SHA256="8ac17e4e3b32c1af3d5508acfffb838640669b4274606b7892aa796ca9d7467f"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="http://www.openal.org/"
PKG_URL="https://github.com/kcat/openal-soft/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib pulseaudio"
PKG_LONGDESC="OpenAL Soft is a software implementation of the OpenAL 3D audio API."

PKG_CMAKE_OPTS_TARGET="-DALSOFT_BACKEND_OSS=off \
                       -DALSOFT_BACKEND_PORTAUDIO=off \
                       -DALSOFT_BACKEND_WAVE=off \
                       -DALSOFT_EXAMPLES=off \
                       -DALSOFT_UTILS=off"

post_makeinstall_target() {
  mkdir -p ${INSTALL}/etc/openal
   sed s/^#drivers.*/drivers=alsa/ ${INSTALL}/usr/share/openal/alsoftrc.sample > ${INSTALL}/etc/openal/alsoft.conf
   safe_remove ${INSTALL}/usr/share/openal
}
