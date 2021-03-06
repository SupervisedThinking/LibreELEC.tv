# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="sdl2_mixer"
PKG_VERSION="922422a2d78cb8c1ade724604529ba9bcc640c9e"
PKG_SHA256="ec0c33acf437b54761273e0b50bfb46caa6203e91d0542e1fd5e3db9baf76a19"
PKG_LICENSE="SDL"
PKG_SITE="https://libsdl.org/projects/SDL_mixer/"
PKG_URL="https://github.com/libsdl-org/SDL_mixer/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain sdl2 flac-system fluidsynth-system libvorbis-system mpg123-system opusfile"
PKG_LONGDESC="An audio mixer that supports various file formats for Simple Directmedia Layer."
PKG_TOOLCHAIN="configure"
