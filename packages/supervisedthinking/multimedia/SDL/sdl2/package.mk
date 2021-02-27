# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="sdl2"
PKG_VERSION="33598563b35067417c2fed8fab03c503438ce6f6" #2.0.15-dev
PKG_SHA256="efe3038bd370148e5a18dd85ba8a13c39a720e175711456a4ffbea50acf61ca4"
PKG_LICENSE="SDL"
PKG_SITE="https://www.libsdl.org/"
PKG_URL="https://github.com/libsdl-org/SDL/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib systemd dbus"
PKG_LONGDESC="Simple DirectMedia Layer is a cross-platform development library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard."

configure_package() {
  # Apply project specific patches
  PKG_PATCH_DIRS+=" ${PROJECT}"

  # Use ppc assembly only for x86_64
  if [ "${TARGET_ARCH}" = "x86_64" ]; then
    PKG_DEPENDS_TARGET+=" nasm:host"
  fi

  # X11 Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" libX11 libXrandr"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi

  # Pulseaudio Support
  if [ "${PULSEAUDIO_SUPPORT}" = yes ]; then
    PKG_DEPENDS_TARGET+=" pulseaudio"
  fi
}

pre_configure_target(){
  PKG_CMAKE_OPTS_TARGET="-DSDL_STATIC=OFF \
                         -DLIBC=ON \
                         -DGCC_ATOMICS=ON \
                         -DALTIVEC=OFF \
                         -DOSS=OFF \
                         -DALSA=ON \
                         -DALSA_SHARED=ON \
                         -DJACK=OFF \
                         -DJACK_SHARED=OFF \
                         -DESD=OFF \
                         -DESD_SHARED=OFF \
                         -DARTS=OFF \
                         -DARTS_SHARED=OFF \
                         -DNAS=OFF \
                         -DNAS_SHARED=OFF \
                         -DLIBSAMPLERATE=OFF \
                         -DLIBSAMPLERATE_SHARED=OFF \
                         -DSNDIO=OFF \
                         -DDISKAUDIO=OFF \
                         -DDUMMYAUDIO=OFF \
                         -DVIDEO_WAYLAND=OFF \
                         -DVIDEO_WAYLAND_QT_TOUCH=ON \
                         -DWAYLAND_SHARED=OFF \
                         -DVIDEO_COCOA=OFF \
                         -DVIDEO_DIRECTFB=OFF \
                         -DVIDEO_VIVANTE=OFF \
                         -DDIRECTFB_SHARED=OFF \
                         -DFUSIONSOUND=OFF \
                         -DFUSIONSOUND_SHARED=OFF \
                         -DVIDEO_DUMMY=OFF \
                         -DPTHREADS=ON \
                         -DPTHREADS_SEM=ON \
                         -DDIRECTX=OFF \
                         -DSDL_DLOPEN=ON \
                         -DCLOCK_GETTIME=OFF \
                         -DRPATH=OFF \
                         -DRENDER_D3D=OFF"

  # Use ppc assembly only for x86_64
  if [ "${TARGET_ARCH}" = "x86_64" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DASSEMBLY=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DASSEMBLY=OFF"
  fi

  # X11 Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_X11=ON \
                             -DX11_SHARED=ON \
                             -DVIDEO_X11_XCURSOR=OFF \
                             -DVIDEO_X11_XINERAMA=OFF \
                             -DVIDEO_X11_XINPUT=OFF \
                             -DVIDEO_X11_XRANDR=ON \
                             -DVIDEO_X11_XSCRNSAVER=OFF \
                             -DVIDEO_X11_XSHAPE=OFF \
                             -DVIDEO_X11_XVM=OFF"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_X11=OFF"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_OPENGL=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_OPENGL=OFF"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_OPENGLES=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_OPENGLES=OFF"
  fi

  # RPi Video Support
  if [ "${OPENGLES}" = "bcm2835-driver" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_RPI=ON \
                             -DVIDEO_VULKAN=OFF \
                             -DVIDEO_KMSDRM=OFF"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_RPI=OFF"
  fi

  # Mali Video Support
  if [ "${OPENGLES}" = "libmali" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_VULKAN=OFF"
  fi

  # Pulseaudio Support
  if [ "${PULSEAUDIO_SUPPORT}" = yes ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DPULSEAUDIO=ON \
                             -DPULSEAUDIO_SHARED=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DPULSEAUDIO=OFF \
                             -DPULSEAUDIO_SHARED=OFF"
  fi
}

post_makeinstall_target() {
  # fix config
  sed -e "s:\(['=\" ]\)/usr:\\1${SYSROOT_PREFIX}/usr:g" -i ${SYSROOT_PREFIX}/usr/bin/sdl2-config

  # clean up
  safe_remove ${INSTALL}/usr/bin
}
