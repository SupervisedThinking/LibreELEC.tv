# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="pyudev"
PKG_VERSION="0.22"
PKG_SHA256="245b5717923bed83993cd50761c3f8f1a1a68e2cd09031adbd30beed4dc60077"
PKG_LICENSE="LGPL-2.1-or-later"
PKG_SITE="https://github.com/pyudev/pyudev"
PKG_URL="https://github.com/pyudev/pyudev/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="pyudev is a LGPL licenced, pure Python 2/3 binding to libudev, the device and hardware management and information library of Linux."

pre_make_target() {
  export PYTHONXCPREFIX="${SYSROOT_PREFIX}/usr"
  export LDFLAGS="${LDFLAGS} -L${SYSROOT_PREFIX}/usr/lib -L${SYSROOT_PREFIX}/lib"
  export LDSHARED="${CC} -shared"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=${INSTALL} --prefix=/usr
}

post_makeinstall_target() {
  find ${INSTALL}/usr/lib/python*/site-packages/  -name "*.py" -exec rm -rf {} ";"
}
