# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="munt"
PKG_VERSION="2_4_0"
PKG_SHA256="53b15a7ad23dcf2f1a6740394389502b63a25885f62b84eaaef21b74bafe5d34"
PKG_LICENSE="LGPL-2.0-or-later"
PKG_SITE="https://github.com/munt/munt"
PKG_URL="https://github.com/munt/munt/archive/munt_${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A software synthesiser emulating pre-GM MIDI devices such as the Roland MT-32."

PKG_CMAKE_OPTS_TARGET="-Dmunt_WITH_MT32EMU_QT=0 \
                       -Dmunt_WITH_MT32EMU_SMF2WAV=0 \
                       -Dlibmt32emu_SHARED=1"
