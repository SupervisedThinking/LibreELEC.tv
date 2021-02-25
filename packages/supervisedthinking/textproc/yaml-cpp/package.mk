# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="yaml-cpp"
PKG_VERSION="a6bbe0e50ac4074f0b9b44188c28cf00caf1a723" #v0.6.3+
PKG_SHA256="e34592214d738498f2d2b4080c607dc59e5e63602b4b7af8d89bcfcc3f390015"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/jbeder/yaml-cpp"
PKG_URL="https://github.com/jbeder/yaml-cpp/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc gcc"
PKG_LONGDESC="yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec."

PKG_CMAKE_OPTS_TARGET="-DYAML_BUILD_SHARED_LIBS=ON \
                       -DYAML_CPP_BUILD_TESTS=Off"

post_makeinstall_target() {
  # clean up
  safe_remove ${INSTALL}/usr/share
}
