# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="pcsx_rearmed"
PKG_VERSION="b715d67a0fee8609b878d46ca644dd70f51dfef2"
PKG_SHA256="d9e6be184fcd8ccc05d9e7a3f6206d2c71022e6f3847e2fe512444b9cabf20ad"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/pcsx_rearmed"
PKG_URL="https://github.com/libretro/pcsx_rearmed/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="PCSX ReARMed is yet another PCSX fork based on the PCSX-Reloaded project, which itself contains code from PCSX, PCSX-df and PCSX-Revolution."
PKG_TOOLCHAIN="make"

configure_package() {
  if [ ! "${ARCH}" = "arm" ]; then
    PKG_BUILD_FLAGS="+lto"
  else
    PKG_BUILD_FLAGS="-gold"
  fi
}

PKG_LIBNAME="pcsx_rearmed_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  cd ${PKG_BUILD}
  
  if target_has_feature neon; then
    PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1 BUILTIN_GPU=neon"
   else
    PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=0"
  fi
  
  case ${TARGET_ARCH} in
    aarch64)
      PKG_MAKE_OPTS_TARGET+=" DYNAREC=lightrec platform=aarch64"
      ;;
    arm)
      PKG_MAKE_OPTS_TARGET+=" DYNAREC=ari64 THREAD_RENDERING=0"
      ;;
    x86_64)
      PKG_MAKE_OPTS_TARGET+=" DYNAREC=lightrec"
      ;;
  esac
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
