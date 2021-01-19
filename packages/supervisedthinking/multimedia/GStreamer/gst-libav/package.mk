# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="gst-libav"
PKG_VERSION="1.18.2"
PKG_SHA256="36969ad44c5f0756a8a90215410710d6c39713d58f6cee13d663be9774557f49"
PKG_LICENSE="GPL"
PKG_SITE="https://gstreamer.freedesktop.org/modules/gst-libav.html"
PKG_URL="https://gstreamer.freedesktop.org/src/gst-libav/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain gstreamer gst-plugins-base ffmpeg"
PKG_LONGDESC="GStreamer plugin for the FFmpeg libav library"
