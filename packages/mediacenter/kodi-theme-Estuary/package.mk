# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="kodi-theme-Estuary"
PKG_VERSION="1.0"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="kodi"
PKG_NEED_UNPACK="$(get_pkg_directory $MEDIACENTER)"
PKG_LONGDESC="Kodi Mediacenter default theme."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/
    cp -a $(get_install_dir kodi)/.noinstall/skin.estuary $INSTALL/usr/share/kodi/addons/

  # Add Chrome & Spotify shortcuts to menu
  if [ ! "${OEM_APPLICATIONS}" = "no" ] && [ "$PROJECT" = "Generic" ]; then
    echo "### Adding Chrome & Spotify to Estuary menu ###"
    patch -d ${INSTALL}/usr/share/kodi/addons/skin.estuary -p1 < ${PKG_DIR}/files/kodi-theme-Estuary-100.01-application-menu.patch
  fi

  # Add Moonlight shortcut to menu 
  if [ ! "${OEM_STREAMING_CLIENTS}" = "no" ]; then
    echo "### Adding Moonlight-Qt to Estuary menu ###"
    patch -d ${INSTALL}/usr/share/kodi/addons/skin.estuary -p1 < ${PKG_DIR}/files/kodi-theme-Estuary-100.05-moonlight-qt-menu.patch
  fi

  # Add Emulationstation shortcut to menu 
  if [ ! "${OEM_EMULATORS}" = "no" ]; then
    echo "### Adding Emulationstation to Estuary menu ###"
    patch -d ${INSTALL}/usr/share/kodi/addons/skin.estuary -p1 < ${PKG_DIR}/files/kodi-theme-Estuary-100.02-emulationstation-menu.patch
  fi

  # Add Retroarch shortcut to menu 
  if [ ! "${OEM_LIBRETRO}" = "no" ]; then
    echo "### Adding Retroarch to Estuary menu ###"
    patch -d ${INSTALL}/usr/share/kodi/addons/skin.estuary -p1 < ${PKG_DIR}/files/kodi-theme-Estuary-100.03-retroarch-menu.patch
  fi

  # Add Pegasus Frontend shortcut to menu 
  if [ ! "${OEM_FRONTENDS_EXTRA}" = "no" ]; then
    echo "### Adding Pegasus-Frontend to Estuary menu ###"
    patch -d ${INSTALL}/usr/share/kodi/addons/skin.estuary -p1 < ${PKG_DIR}/files/kodi-theme-Estuary-100.04-pegasus-menu.patch
  fi
}
