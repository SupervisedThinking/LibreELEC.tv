# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="libsndfile-system"
PKG_VERSION="1.0.31"
PKG_SHA256="8cdee0acb06bb0a3c1a6ca524575643df8b1f3a55a0893b4dd9f829d08263785"
PKG_LICENSE="LGPL-2.1-or-later"
PKG_SITE="https://libsndfile.github.io/libsndfile/"
PKG_URL="https://github.com/libsndfile/libsndfile/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib flac-system libvorbis-system opus-system"
PKG_LONGDESC="A C library for reading and writing sound files containing sampled audio data."
PKG_BUILD_FLAGS="+pic -sysroot"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SHARED_LIBS=ON \
                       -DBUILD_PROGRAMS=OFF \
                       -DBUILD_EXAMPLES=OFF \
                       -DBUILD_TESTING=OFF \
                       -DBUILD_REGTEST=OFF \
                       -DINSTALL_MANPAGES=OFF"
