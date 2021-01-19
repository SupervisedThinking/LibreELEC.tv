# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="retroarch"
PKG_VERSION="5e551dd92b79d8127e66939835ea3c2a140c4078" #1.9.0
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/RetroArch"
PKG_URL="https://github.com/libretro/RetroArch.git"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd dbus openssl expat alsa-lib libpng libusb libass speex tinyalsa fluidsynth-system freetype zlib bzip2 ffmpeg common-overlays-lr core-info-lr database-lr glsl-shaders-lr overlay-borders-lr samples-lr retroarch-assets retroarch-joypad-autoconfig libxkbcommon"
PKG_LONGDESC="Reference frontend for the libretro API."
GET_HANDLER_SUPPORT="git"
PKG_BUILD_FLAGS="+lto"

configure_package() {
  # SAMBA Support
  if [ "${SAMBA_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" samba"
  fi

  # AVAHI Support
  if [ "${AVAHI_DAEMON}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" avahi nss-mdns"
  fi

  # Pulseaudio Support
  if [ "${PULSEAUDIO_SUPPORT}" = yes ]; then
    PKG_DEPENDS_TARGET+=" pulseaudio"
  fi

  # QT Support for WIMP GUI
  if [ "${PROJECT}" = "Generic" ]; then
    PKG_DEPENDS_TARGET+=" qt-everywhere"
  fi

  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server unclutter-xfixes"
  fi

  # Build with OpenGL / OpenGLES support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi

  # Vulkan Support
  if [ "${VULKAN_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" vulkan-loader slang-shaders-lr"
  fi
}

pre_configure_target() {
  TARGET_CONFIGURE_OPTS=""
  PKG_CONFIGURE_OPTS_TARGET="--disable-vg \
                             --disable-sdl \
                             --disable-xvideo \
                             --disable-al \
                             --disable-oss \
                             --enable-zlib \
                             --host=${TARGET_NAME} \
                             --enable-freetype"

  # QT Support for WIMP GUI
  if [ "${PROJECT}" = "Generic" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-qt"
  else
    PKG_CONFIGURE_OPTS_TARGET+=" --disable-qt"
  fi

  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-x11"
  else
    PKG_CONFIGURE_OPTS_TARGET+=" --disable-x11"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-opengl \
                                 --enable-kms"
  else
    PKG_CONFIGURE_OPTS_TARGET+=" --disable-opengl1"
  fi

  # Vulkan Support
  if [ "${VULKAN_SUPPORT}" = "yes" ]; then
     PKG_CONFIGURE_OPTS_TARGET+=" --enable-vulkan"
  fi

  # OpenGL ES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-opengles"

    # RPi OpenGL ES 2.0 Features Support
    if [ "${OPENGLES}" = "bcm2835-driver" ]; then
      PKG_CONFIGURE_OPTS_TARGET+=" --disable-opengl_core \
                                   --enable-dispmanx \
                                   --disable-kms"

    # Mesa 3D OpenGL ES
    elif [ "${OPENGLES}" = "mesa" ]; then
      PKG_CONFIGURE_OPTS_TARGET+=" --enable-kms"
      CFLAGS+=" -DMESA_EGL_NO_X11_HEADERS"
      CXXFLAGS+=" -DMESA_EGL_NO_X11_HEADERS"

      if [ "${DEVICE}" = "RPi4" ]; then
        PKG_CONFIGURE_OPTS_TARGET+=" --enable-opengles3 \
                                     --disable-videocore"
      fi

    # Mali OpenGL ES 2.0/3.0 Features Support
    elif [ "${OPENGLES}" = "libmali" ]; then
      if listcontains "${MALI_FAMILY}" "4[0-9]+"; then
        PKG_CONFIGURE_OPTS_TARGET+=" --disable-opengl_core \
                                     --disable-opengles3"
      else
        PKG_CONFIGURE_OPTS_TARGET+=" --enable-opengles3"
      fi
      PKG_CONFIGURE_OPTS_TARGET+=" --enable-kms"
    fi
  fi

  # NEON Support
  if target_has_feature neon; then
    PKG_CONFIGURE_OPTS_TARGET+=" --enable-neon"
  fi

  # Export pkg-config path
  export PKG_CONF_PATH=${TOOLCHAIN}/bin/pkg-config

  # Clean up
  cd ..
  safe_remove .${TARGET_NAME}
}

make_target() {
  # Build Retroarch & exit if build fails
  make GIT_VERSION=${PKG_VERSION:0:7}
  if [ ! -f ${PKG_BUILD}/retroarch ] ; then
    exit 0
  fi

  # Build Video & DSP filters
  make -C gfx/video_filters compiler=${CC} extra_flags="${CFLAGS}" 
  make -C libretro-common/audio/dsp_filters compiler=${CC} extra_flags="${CFLAGS}" 
}

makeinstall_target() {
  mkdir -p ${INSTALL}/etc
    cp ${PKG_BUILD}/retroarch.cfg ${INSTALL}/etc
  mkdir -p ${INSTALL}/usr/share/retroarch/filters/video
    cp ${PKG_BUILD}/gfx/video_filters/*.so ${INSTALL}/usr/share/retroarch/filters/video
    cp ${PKG_BUILD}/gfx/video_filters/*.filt ${INSTALL}/usr/share/retroarch/filters/video
  mkdir -p ${INSTALL}/usr/share/retroarch/filters/audio
    cp ${PKG_BUILD}/libretro-common/audio/dsp_filters/*.so ${INSTALL}/usr/share/retroarch/filters/audio
    cp ${PKG_BUILD}/libretro-common/audio/dsp_filters/*.dsp ${INSTALL}/usr/share/retroarch/filters/audio
  mkdir -p ${INSTALL}/usr/bin
    cp ${PKG_BUILD}/retroarch ${INSTALL}/usr/bin
    cp -rf $PKG_DIR/scripts/common/*     $INSTALL/usr/bin/
    cp -rf $PKG_DIR/scripts/${PROJECT}/* $INSTALL/usr/bin/

  if [ "${PROJECT}" = "Generic" ]; then
    mkdir -p ${INSTALL}/usr/config/retroarch
    cp -PR ${PKG_DIR}/config/* ${INSTALL}/usr/config/retroarch/
  fi
  
  # General path configuration
  sed -e "s/# savefile_directory =/savefile_directory = \"\/storage\/.config\/retroarch\/saves\"/"                          -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# screenshot_directory =/screenshot_directory = \"\/storage\/screenshots\"/"                                    -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# recording_output_directory =/recording_output_directory = \"\/storage\/recordings\/retroarch\"/"              -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# recording_config_directory =/recording_config_directory = \"\/storage\/.config\/retroarch\/records_config\"/" -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# libretro_directory =/libretro_directory = \"\/tmp\/cores\"/"                                                  -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# libretro_info_path =/libretro_info_path = \"\/tmp\/coreinfo\"/"                                               -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# video_shader_dir =/video_shader_dir = \"\/tmp\/shaders\"/"                                                    -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# content_database_path =/content_database_path = \"\/tmp\/database\/rdb\"/"                                    -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# cheat_database_path =/cheat_database_path = \"\/tmp\/database\/cht\"/"                                        -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# cursor_directory =/cursor_directory = \"\/tmp\/database\/cursors\"/"                                          -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# assets_directory =/assets_directory = \"\/tmp\/assets\"/"                                                     -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# overlay_directory =/overlay_directory = \"\/tmp\/overlay\"/"                                                  -i ${INSTALL}/etc/retroarch.cfg

  # General menu configuration
  sed -e "s/# rgui_browser_directory =/rgui_browser_directory = \"\/storage\/roms\"/" -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# system_directory =/system_directory = \"\/storage\/roms\/bios\"/"       -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# rgui_show_start_screen = true/rgui_show_start_screen = false/"          -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# menu_driver = \"rgui\"/menu_driver = \"xmb\"/"                          -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# video_shared_context = false/video_shared_context = true/"              -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# menu_show_core_updater = true/# menu_show_core_updater = false/"        -i ${INSTALL}/etc/retroarch.cfg

  # Video
  sed -e "s/# framecount_show =/framecount_show = false/"                                         -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# video_fullscreen = false/video_fullscreen = true/"                                  -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# video_windowed_fullscreen = true/video_windowed_fullscreen = false/"                -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# video_smooth = true/video_smooth = false/"                                          -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# video_aspect_ratio_auto = false/video_aspect_ratio_auto = true/"                    -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# video_font_size = 48/video_font_size = 32/"                                         -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# video_filter_dir =/video_filter_dir = \"\/usr\/share\/retroarch\/filters\/video\"/" -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# video_gpu_screenshot = true/video_gpu_screenshot = false/"                          -i ${INSTALL}/etc/retroarch.cfg

  # Audio
  if [ "$DEVICE" = "RPi4" ]; then
    sed -i -e "s/# audio_driver =/audio_driver = \"alsa\"/" $INSTALL/etc/retroarch.cfg
  else
    sed -i -e "s/# audio_driver =/audio_driver = \"alsathread\"/" $INSTALL/etc/retroarch.cfg
  fi
  sed -i -e "s/# audio_filter_dir =/audio_filter_dir =\/usr\/share\/audio_filters/" $INSTALL/etc/retroarch.cfg
  if [ "$PROJECT" = "OdroidXU3" -o "$DEVICE" = "RPi4" ]; then # workaround the 55fps bug + fix no audio for RPi4
    sed -i -e "s/# audio_out_rate = 48000/audio_out_rate = 44100/" $INSTALL/etc/retroarch.cfg
  fi
  if [ "$DEVICE" = "RPi4" ]; then
    sed -i -e "s/# audio_device =/audio_device = \"hw:0,1\"/" $INSTALL/etc/retroarch.cfg
  fi

  # Input
  sed -e "s/# input_driver = sdl/input_driver = udev/"                                                            -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# input_max_users = 16/input_max_users = 5/"                                                          -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# input_autodetect_enable = true/input_autodetect_enable = true/"                                     -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# joypad_autoconfig_dir =/joypad_autoconfig_dir = \/tmp\/autoconfig/"                                 -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# input_remapping_directory =/input_remapping_directory = \/storage\/.config\/retroarch\/remappings/" -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# input_menu_toggle_gamepad_combo = 0/input_menu_toggle_gamepad_combo = 2/"                           -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# input_exit_emulator = escape/input_exit_emulator = ralt/"                                           -i ${INSTALL}/etc/retroarch.cfg

  # Menu
  sed -e "s/# menu_mouse_enable = false/menu_mouse_enable = false/"                                     -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# menu_core_enable = true/menu_core_enable = false/"                                        -i ${INSTALL}/etc/retroarch.cfg
  sed -e "s/# thumbnails_directory =/thumbnails_directory = \/storage\/.config\/retroarch\/thumbnails/" -i ${INSTALL}/etc/retroarch.cfg
  echo "menu_show_advanced_settings = \"false\"" >> ${INSTALL}/etc/retroarch.cfg
  echo "menu_wallpaper_opacity = \"1.0\""        >> ${INSTALL}/etc/retroarch.cfg
  echo "content_show_images = \"false\""         >> ${INSTALL}/etc/retroarch.cfg
  echo "content_show_music = \"false\""          >> ${INSTALL}/etc/retroarch.cfg
  echo "content_show_video = \"false\""          >> ${INSTALL}/etc/retroarch.cfg
  echo "xmb_menu_color_theme = \"8\""            >> ${INSTALL}/etc/retroarch.cfg

  # Updater
  if [ "${TARGET_ARCH}" = "arm" ]; then
    sed -e "s/# core_updater_buildbot_url = \"http:\/\/buildbot.libretro.com\"/core_updater_buildbot_url = \"http:\/\/buildbot.libretro.com\/nightly\/linux\/armhf\/latest\/\"/" -i ${INSTALL}/etc/retroarch.cfg
  fi

  # Playlists
  echo "playlist_names = \"${RA_PLAYLIST_NAMES}\"" >> ${INSTALL}/etc/retroarch.cfg
  echo "playlist_cores = \"${RA_PLAYLIST_CORES}\"" >> ${INSTALL}/etc/retroarch.cfg
}

post_install() {  
  enable_service tmp-assets.mount
  enable_service tmp-autoconfig.mount
  enable_service tmp-coreinfo.mount
  enable_service tmp-cores.mount
  enable_service tmp-database.mount
  enable_service tmp-overlay.mount
  enable_service tmp-shaders.mount
}
