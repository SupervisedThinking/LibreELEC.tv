# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="ds4drv"
PKG_VERSION="be7327f"
PKG_SHA256="d346c5adccab076a9025b5c2a2340a6434a815d55c637164fe554a3ae60d6c62"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/chrippa/ds4drv"
PKG_URL="https://github.com/chrippa/ds4drv/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host python-evdev pyudev setuptools"
PKG_LONGDESC="ds4drv is a Sony DualShock 4 userspace driver for Linux."
PKG_TOOLCHAIN="manual"

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
  sed -i -e "s/^#\!.*/#\!\/usr\/bin\/python/" ${INSTALL}/usr/bin/ds4drv
  mkdir -p ${INSTALL}/usr/config
  cp ds4drv.conf ${INSTALL}/usr/config/
}
