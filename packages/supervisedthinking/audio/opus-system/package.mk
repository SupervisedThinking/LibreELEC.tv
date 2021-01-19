# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="opus-system"
PKG_VERSION="1.3.1"
PKG_SHA256="4834a8944c33a7ecab5cad9454eeabe4680ca1842cb8f5a2437572dbf636de8f"
PKG_LICENSE="BSD"
PKG_SITE="http://www.opus-codec.org"
PKG_URL="https://github.com/xiph/opus/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Codec designed for interactive speech and audio transmission over the Internet."

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-D BUILD_SHARED_LIBS=ON"

  if [ "${TARGET_ARCH}" = "arm" ]; then
    if ! target_has_feature neon; then
      PKG_CMAKE_OPTS_TARGET+=" -D OPUS_FIXED_POINT=ON"
    fi
  fi
}
