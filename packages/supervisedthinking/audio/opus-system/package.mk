# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="opus-system"
PKG_VERSION="e85ed7726db5d677c9c0677298ea0cb9c65bdd23" #v1.3.1
PKG_LICENSE="BSD"
PKG_SITE="http://www.opus-codec.org"
PKG_URL="https://github.com/xiph/opus.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Codec designed for interactive speech and audio transmission over the Internet."
GET_HANDLER_SUPPORT="git"

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-D BUILD_SHARED_LIBS=ON"

  if [ "${TARGET_ARCH}" = "arm" ]; then
    if ! target_has_feature neon; then
      PKG_CMAKE_OPTS_TARGET+=" -D OPUS_FIXED_POINT=ON"
    fi
  fi
}
