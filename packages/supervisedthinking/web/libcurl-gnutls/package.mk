# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="libcurl-gnutls"
PKG_VERSION="7.75.0"
PKG_SHA256="fe0c49d8468249000bda75bcfdf9e30ff7e9a86d35f1a21f428d79c389d55675"
PKG_LICENSE="MIT"
PKG_SITE="http://curl.haxx.se"
PKG_URL="http://curl.haxx.se/download/curl-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain glibc zlib gnutls rtmpdump nettle libidn2 nghttp2"
PKG_LONGDESC="An URL retrieval library linked against gnutls without versioned symbols"
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="-gold -sysroot"

pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="ac_cv_lib_rtmp_RTMP_Init=yes \
                             ac_cv_header_librtmp_rtmp_h=yes \
                             --disable-debug \
                             --enable-optimize \
                             --enable-warnings \
                             --disable-curldebug \
                             --disable-ares \
                             --enable-largefile \
                             --enable-http \
                             --enable-ftp \
                             --enable-file \
                             --disable-ldap \
                             --disable-ldaps \
                             --enable-rtsp \
                             --enable-proxy \
                             --disable-dict \
                             --disable-telnet \
                             --disable-tftp \
                             --disable-pop3 \
                             --disable-imap \
                             --disable-smb \
                             --disable-smtp \
                             --disable-gopher \
                             --disable-manual \
                             --enable-libgcc \
                             --enable-ipv6 \
                             --disable-versioned-symbols \
                             --enable-nonblocking \
                             --enable-threaded-resolver \
                             --enable-verbose \
                             --disable-sspi \
                             --enable-crypto-auth \
                             --enable-cookies \
                             --disable-soname-bump \
                             --with-gnu-ld \
                             --without-krb4 \
                             --without-spnego \
                             --without-gssapi \
                             --with-zlib \
                             --without-egd-socket \
                             --enable-thread \
                             --with-random=/dev/urandom \
                             --with-gnutls \
                             --without-ssl \
                             --without-mbedtls \
                             --without-nss \
                             --with-ca-bundle=/run/libreelec/cacert.pem \
                             --without-ca-path \
                             --without-libpsl \
                             --without-libmetalink \
                             --without-libssh2 \
                             --with-librtmp \
                             --with-libidn2 \
                             --with-nghttp2"
}

makeinstall_target() {
  # Create lib directory & install lib as libcurl-gnutls.so.*
  mkdir -p ${INSTALL}/usr/lib
  cp -f ${PKG_BUILD}/.${TARGET_NAME}/lib/.libs/libcurl.so.4.?.? ${INSTALL}/usr/lib/libcurl-gnutls.so.4.7.0

  # Create symlinks to libcurl-gnutls.so
  for version in \
    3 \
    4 \
    4.0.0 \
    4.1.0 \
    4.2.0 \
    4.3.0 \
    4.4.0 \
    4.5.0 \
    4.6.0;
  do
    ln -s libcurl-gnutls.so.4.7.0 ${INSTALL}/usr/lib/libcurl-gnutls.so.${version}
  done
}
