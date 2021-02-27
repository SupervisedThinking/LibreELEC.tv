# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mesa"
PKG_LICENSE="OSS"
PKG_SITE="http://www.mesa3d.org/"
PKG_DEPENDS_TARGET="toolchain expat libdrm Mako:host zstd"
PKG_LONGDESC="Mesa is a 3-D graphics library with an API."
PKG_TOOLCHAIN="meson"

if [ "${OPENGLES}" = "mesa" ]; then
  PKG_VERSION="f67259d83bcc9b7775ca710fe9d6e75f00f08175" #21.1.0-devel
  PKG_SHA256="02dd741822db280329263f1e7b14b6189e6953c30158ae5af689f3ba06d8f5be"
  PKG_URL="https://github.com/mesa3d/mesa/archive/${PKG_VERSION}.tar.gz"
else
  PKG_VERSION="21.0.0-rc5"
  PKG_SHA256="f57d23aa69d5ed7cfde250a7bf8f72285a34692f9e8d541532fa6970f941ce01"
  PKG_URL="https://mesa.freedesktop.org/archive/mesa-${PKG_VERSION}.tar.xz"
fi

get_graphicdrivers

PKG_MESON_OPTS_TARGET="-Ddri-drivers=${DRI_DRIVERS// /,} \
                       -Dgallium-drivers=${GALLIUM_DRIVERS// /,} \
                       -Dgallium-extra-hud=false \
                       -Dgallium-xvmc=disabled \
                       -Dgallium-omx=disabled \
                       -Dgallium-nine=false \
                       -Dgallium-opencl=disabled \
                       -Dshader-cache=enabled \
                       -Dshared-glapi=enabled \
                       -Dopengl=true \
                       -Dgbm=enabled \
                       -Degl=enabled \
                       -Dvalgrind=disabled \
                       -Dlibunwind=disabled \
                       -Dlmsensors=disabled \
                       -Dbuild-tests=false \
                       -Dselinux=false \
                       -Dosmesa=false"

if [ "${DISPLAYSERVER}" = "x11" ]; then
  PKG_DEPENDS_TARGET+=" xorgproto libXext libXdamage libXfixes libXxf86vm libxcb libX11 libxshmfence libXrandr libglvnd"
  export X11_INCLUDES=
  PKG_MESON_OPTS_TARGET+=" -Dplatforms=x11 -Ddri3=enabled -Dglx=dri -Dglvnd=true"
elif [ "${DISPLAYSERVER}" = "weston" ]; then
  PKG_DEPENDS_TARGET+=" wayland wayland-protocols"
  PKG_MESON_OPTS_TARGET+=" -Dplatforms=wayland -Ddri3=disabled -Dglx=disabled -Dglvnd=false"
else
  PKG_MESON_OPTS_TARGET+=" -Dplatforms="" -Ddri3=disabled -Dglx=disabled -Dglvnd=false"
fi

if [ "${LLVM_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" elfutils llvm"
  PKG_MESON_OPTS_TARGET+=" -Dllvm=enabled"
else
  PKG_MESON_OPTS_TARGET+=" -Dllvm=disabled"
fi

if [ "${VDPAU_SUPPORT}" = "yes" -a "${DISPLAYSERVER}" = "x11" ]; then
  PKG_DEPENDS_TARGET+=" libvdpau"
  PKG_MESON_OPTS_TARGET+=" -Dgallium-vdpau=enabled"
else
  PKG_MESON_OPTS_TARGET+=" -Dgallium-vdpau=disabled"
fi

if [ "${VAAPI_SUPPORT}" = "yes" ] && listcontains "${GRAPHIC_DRIVERS}" "(r600|radeonsi)"; then
  PKG_DEPENDS_TARGET+=" libva"
  PKG_MESON_OPTS_TARGET+=" -Dgallium-va=enabled"
else
  PKG_MESON_OPTS_TARGET+=" -Dgallium-va=disabled"
fi

if listcontains "${GRAPHIC_DRIVERS}" "vmware"; then
  PKG_MESON_OPTS_TARGET+=" -Dgallium-xa=enabled"
else
  PKG_MESON_OPTS_TARGET+=" -Dgallium-xa=disabled"
fi

if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
  PKG_MESON_OPTS_TARGET+=" -Dgles1=disabled -Dgles2=enabled"
else
  PKG_MESON_OPTS_TARGET+=" -Dgles1=disabled -Dgles2=disabled"
fi

if [ "${VULKAN_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" vulkan-loader"
  PKG_MESON_OPTS_TARGET+=" -Dvulkan-drivers=amd,intel"
else
  PKG_MESON_OPTS_TARGET+=" -Dvulkan-drivers="
fi
