# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="wxwidgets"
PKG_VERSION="3.0.5.1"
PKG_SHA256="bae4d9f289e33a05fb8553fcc580564d30efe6a882ff08e3d4e09ef01f5f6578"
PKG_LICENSE="wxWidgets licence"
PKG_SITE="https://github.com/wxWidgets/wxWidgets"
PKG_URL="https://github.com/wxWidgets/wxWidgets/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libSM gtk3-system"
PKG_LONGDESC="wxWidgets is a free and open source cross-platform C++ framework for writing advanced GUI applications using native controls."
PKG_TOOLCHAIN="configure"
PKG_DEPENDS_CONFIG="pango"

pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="--disable-option-checking \
                             --disable-tests \
                             --disable-precomp-headers \
                             --with-gtk=3"
}

post_makeinstall_target() {
  # clean up
  safe_remove ${INSTALL}

  # install libs
  mkdir -p ${INSTALL}/usr/lib
    cp -PR lib/libwx_baseu-${PKG_VERSION:0:3}*      ${INSTALL}/usr/lib
    cp -PR lib/libwx_gtk3u_adv-${PKG_VERSION:0:3}*  ${INSTALL}/usr/lib
    cp -PR lib/libwx_gtk3u_core-${PKG_VERSION:0:3}* ${INSTALL}/usr/lib

  # fix wx-config paths                              
  WX_CONFIG_PATH=${SYSROOT_PREFIX}/usr/lib/wx/config/${TARGET_NAME}-gtk3-unicode-${PKG_VERSION:0:3}
    sed -e "s:^prefix=.*:prefix=${PKG_ORIG_SYSROOT_PREFIX}/usr:g"                         -i ${WX_CONFIG_PATH}
    sed -e "s:^wxconfdir=.*:wxconfdir=\"${PKG_ORIG_SYSROOT_PREFIX}/usr/lib/wx/config\":g" -i ${WX_CONFIG_PATH}
    sed -e "s:^libdir=.*:libdir=\"${PKG_ORIG_SYSROOT_PREFIX}/usr/lib\":g"                 -i ${WX_CONFIG_PATH}
    sed -e "s:^bindir=.*:bindir=\"${PKG_ORIG_SYSROOT_PREFIX}/usr/bin\":g"                 -i ${WX_CONFIG_PATH}
}
