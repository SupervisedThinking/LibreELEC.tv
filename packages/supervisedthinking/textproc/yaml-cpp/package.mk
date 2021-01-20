# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="yaml-cpp"
PKG_VERSION="0.6.3"
PKG_SHA256="77ea1b90b3718aa0c324207cb29418f5bced2354c2e483a9523d98c3460af1ed"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/jbeder/yaml-cpp"
PKG_URL="https://github.com/jbeder/yaml-cpp/archive/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc gcc"
PKG_LONGDESC="yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec."

PKG_CMAKE_OPTS_TARGET="-DYAML_BUILD_SHARED_LIBS=ON \
                       -DYAML_CPP_BUILD_TESTS=Off"
