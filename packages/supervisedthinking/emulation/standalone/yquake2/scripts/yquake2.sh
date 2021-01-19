#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

# Source environment variables
. /etc/profile

# Set common paths
YQ2_HOME_CONFIG=/storage/.config/games/yquake2
YQ2_HOME=/storage/.yq2

# create link to config directory
if [ ! -L ${YQ2_HOME} ]; then
  if [ -d ${YQ2_HOME} ]; then
    cp -rf ${YQ2_HOME} ${YQ2_HOME_CONFIG}
    rm -rf ${YQ2_HOME}
  fi
  ln -sf ${YQ2_HOME_CONFIG} ${YQ2_HOME}
fi

# Stop Kodi service / load audio backend config
kodi-service.sh --stop

# Set OpenAL audio driver to Pulseaudio or ALSA
set_OpenAL_audiodriver

# Set SDL audio driver to PulseAudio or ALSA
set_SDL_audiodriver

# Run the emulator
quake2 "$@" > /var/log/yquake2.log 2>&1

# Set OpenAL audio driver to ALSA
rm /storage/.alsoftrc

# Switch back to frontends or start Kodi service / unload audio backend config
pidof emulationstation > /dev/null 2>&1 || pidof pegasus-fe > /dev/null 2>&1 || kodi-service.sh --start
