# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="overlay-borders-lr"
PKG_VERSION="9aceca2dd514c589a57d40086557b804851aafcf"
PKG_SHA256="f78ca10f26a960c902440512a4fa790b411551b1710ae64a3a1418af05fede58"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/overlay-borders"
PKG_URL="https://github.com/libretro/overlay-borders/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="A place for collecting decorative/cosmetic overlays for use with RetroArch."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  PKG_OVERLAY_INSTALL_PATH=${INSTALL}/usr/share/retroarch/overlay/borders/systems
  mkdir -p ${PKG_OVERLAY_INSTALL_PATH}
  # Install overlay borders
  for PKG_OVERLAY_FILE in \
    "16x9 Collections/NyNy77 1080 Bezel/NintendoEntertainmentSystem-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/NintendoGameCube-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/NintendoSuperNintendo-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/NintendoSNES-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/NintendoN64-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/NintendoGameBoyColorNoir-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/SegaMegadrive-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/SegaSaturnEU-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/SegaDreamcast-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/SonyPlaystation-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/Mame-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/BandaiWonderSwanColor-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/IBM-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/SinclairZXSpectrum-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/Amiga-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/ScummVM-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/Commodore64-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/Vierge-nyny77" \
    "16x9 Collections/NyNy77 1080 Bezel/ViergeVertical-nyny77"
  do
    cp -v ${PKG_BUILD}/"${PKG_OVERLAY_FILE}".cfg ${PKG_OVERLAY_INSTALL_PATH}
    cp -v ${PKG_BUILD}/"${PKG_OVERLAY_FILE}".png ${PKG_OVERLAY_INSTALL_PATH}
  done
}
