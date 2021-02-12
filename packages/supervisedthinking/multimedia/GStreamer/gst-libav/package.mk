# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gst-libav"
PKG_VERSION="1.18.3"
PKG_SHA256="ad20546bcd78ac1e7cf194666d73c4f33efeb62647d2b6af22993b540699e91c"
PKG_LICENSE="GPL-2.0-or-later"
PKG_SITE="https://gstreamer.freedesktop.org/modules/gst-libav.html"
PKG_URL="https://gstreamer.freedesktop.org/src/gst-libav/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain gstreamer gst-plugins-base ffmpeg"
PKG_LONGDESC="GStreamer plugin for the FFmpeg libav library"
