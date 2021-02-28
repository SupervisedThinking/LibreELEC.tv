# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="sdl2_ttf"
PKG_VERSION="2.0.15"
PKG_SHA256="02e887b560faf398cbd60f56ce0a1cbaf96012dd4ddaa455f8307cb4911c86cc"
PKG_LICENSE="SDL"
PKG_SITE="http://www.libsdl.org/"
PKG_URL="https://github.com/libsdl-org/SDL_ttf/archive/release-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain sdl2 freetype"
PKG_LONGDESC="This is a sample library which allows you to use TrueType fonts in your SDL applications"
PKG_TOOLCHAIN="configure"
