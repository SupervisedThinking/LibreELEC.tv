# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="vlc"
PKG_VERSION="3.0.12"
PKG_SHA256="eff458f38a92126094f44f2263c2bf2c7cdef271b48192d0fe7b1726388cf879"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://get.videolan.org/vlc/${PKG_VERSION}/vlc-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain dbus gnutls ffmpeg libmpeg2 zlib flac-system libvorbis-system"
PKG_LONGDESC="VideoLAN multimedia player and streamer"

configure_package() {
  # MMAL (Multimedia Abstraction Layer) support patches
  if [ "${OPENGLES}" = "bcm2835-driver" ]; then
    PKG_PATCH_DIRS="MMAL"
  fi

  # Mesa 3D support patch
  if [ "${OPENGLES}" = "mesa" ]; then
    PKG_PATCH_DIRS="OpenGL"
  fi

  # Build with OpenGL / OpenGLES support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi

  if target_has_feature "(neon|sse)"; then
    PKG_DEPENDS_TARGET+=" dav1d libvpx-system"
  fi
}

pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="--enable-silent-rules \
                             --disable-dependency-tracking \
                             --disable-nls \
                             --disable-rpath \
                             --disable-sout \
                             --disable-lua \
                             --disable-vlm \
                             --disable-taglib \
                             --disable-live555 \
                             --disable-dc1394 \
                             --disable-dvdread \
                             --disable-dvdnav \
                             --disable-opencv \
                             --disable-decklink \
                             --disable-sftp \
                             --disable-v4l2 \
                             --disable-vcd \
                             --disable-libcddb \
                             --disable-dvbpsi \
                             --disable-screen \
                             --enable-ogg \
                             --disable-shout\
                             --disable-mod \
                             --enable-mpc \
                             --disable-gme \
                             --disable-wma-fixed \
                             --disable-shine \
                             --disable-omxil \
                             --disable-mad \
                             --disable-merge-ffmpeg \
                             --enable-avcodec \
                             --enable-avformat \
                             --enable-swscale \
                             --enable-postproc \
                             --disable-faad \
                             --enable-flac \
                             --enable-aa \
                             --disable-twolame \
                             --disable-realrtsp \
                             --disable-libtar \
                             --disable-a52 \
                             --disable-dca \
                             --enable-libmpeg2 \
                             --enable-vorbis \
                             --disable-tremor \
                             --disable-speex \
                             --disable-theora \
                             --disable-schroedinger \
                             --disable-png \
                             --disable-x264 \
                             --disable-x26410b \
                             --disable-fluidsynth \
                             --disable-zvbi \
                             --disable-telx \
                             --disable-libass \
                             --disable-kate \
                             --disable-tiger \
                             --disable-xcb \
                             --disable-xvideo \
                             --disable-sdl-image \
                             --disable-freetype \
                             --disable-fribidi \
                             --disable-fontconfig \
                             --enable-libxml2 \
                             --disable-svg \
                             --disable-directx \
                             --disable-caca \
                             --disable-oss \
                             --enable-pulse \
                             --enable-alsa \
                             --disable-jack \
                             --disable-upnp \
                             --disable-skins2 \
                             --disable-kai \
                             --disable-qt \
                             --disable-macosx \
                             --disable-macosx-qtkit \
                             --disable-ncurses \
                             --disable-goom \
                             --disable-projectm \
                             --enable-udev \
                             --disable-mtp \
                             --disable-lirc \
                             --disable-libgcrypt \
                             --enable-gnutls \
                             --disable-update-check \
                             --disable-kva \
                             --disable-bluray \
                             --disable-samplerate \
                             --disable-sid \
                             --disable-crystalhd \
                             --disable-dxva2 \
                             --disable-aom \
                             --disable-gst-decode \
                             --disable-vlc"

  # X11 Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" --with-x"
  else
    PKG_CONFIGURE_OPTS_TARGET+=" --without-x"
  fi

  # MMAL Support for RPi
  if [ "${OPENGLES}" = "bcm2835-driver" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-mmal"
  fi

  # GLES2 Support for RPi4
  if [ "${DEVICE}" = "RPi4" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-gles2"
  fi

  # NEON Support
  if target_has_feature neon; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-neon"
  fi

  # libdav1d & libvpx Support
  if target_has_feature "(neon|sse)"; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-dav1d \
                                 --enable-vpx"
  else
    PKG_CONFIGURE_OPTS_TARGET+=" --disable-dav1d \
                                 --disable-vpx"
  fi

  # Fix outdated automake for Linux Mint 18.04
  sed -e "s/am__api_version='1.16'/am__api_version='1.15'/" -i ${PKG_BUILD}/configure
  LDFLAGS+=" -lresolv"
}

post_makeinstall_target() {
  # Clean up
  safe_remove ${INSTALL}/usr/share
}
