# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="opusfile"
PKG_VERSION="0.12"
PKG_SHA256="a20a1dff1cdf0719d1e995112915e9966debf1470ee26bb31b2f510ccf00ef40"
PKG_LICENSE="BSD"
PKG_SITE="http://www.opus-codec.org"
PKG_URL="https://github.com/xiph/opusfile/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain opus-system libogg-system"
PKG_LONGDESC="Stand-alone decoder library for .opus streams"
PKG_TOOLCHAIN="autotools"

post_unpack() {
  # Fix opusfile version
  echo PACKAGE_VERSION=\"${PKG_VERSION}\" > ${PKG_BUILD}/package_version
}

pre_configure_target() {
  if [ "${TARGET_ARCH}" = "arm" ]; then
    if ! target_has_feature neon; then
      PKG_CONFIGURE_OPTS_TARGET+=" --enable-fixed-point"
    fi
  fi
}
