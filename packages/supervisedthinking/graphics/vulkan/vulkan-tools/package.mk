# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="vulkan-tools"
PKG_VERSION="1.2.172"
PKG_SHA256="29b2ec0c4b23b152614be8ecee814ec6c98e76f2ae2db673229dada46178f69c"
PKG_LICENSE="Apache 2.0"
PKG_SITE="https://github.com/KhronosGroup/Vulkan-Tools"
PKG_URL="https://github.com/KhronosGroup/Vulkan-tools/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain cmake:host vulkan-loader"
PKG_LONGDESC="This project provides Khronos official Vulkan Tools and Utilities."

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DBUILD_ICD=Off \
                         -DINSTALL_ICD=Off"

  # Disable Wayland WSI support
  sed -e "s/Build Wayland WSI support\" ON/Build Wayland WSI support\" OFF/" -i ${PKG_BUILD}/cube/CMakeLists.txt
  sed -e "s/Build Wayland WSI support\" ON/Build Wayland WSI support\" OFF/" -i ${PKG_BUILD}/vulkaninfo/CMakeLists.txt
}

pre_make_target() {
  # Fix cross compiling
  find ${PKG_BUILD} -name flags.make -exec sed -i  "s:isystem :I:g" \{} \;
  find ${PKG_BUILD} -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}
