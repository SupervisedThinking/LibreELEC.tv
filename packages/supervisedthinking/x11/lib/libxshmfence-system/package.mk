# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="libxshmfence-system"
PKG_VERSION="1.3"
PKG_SHA256="b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
PKG_LICENSE="OSS"
PKG_SITE="http://www.X.org"
PKG_URL="http://xorg.freedesktop.org/archive/individual/lib/${PKG_NAME:0:12}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain util-macros xorgproto"
PKG_LONGDESC="libxshmfence is the Shared memory 'SyncFence' synchronization primitive."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic -sysroot"
