#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (at) gmail.com)

# Source environment variables
. /etc/profile
oe_setup_addon service.rr-config-tool

# Set common variables
RR_FLUIDSYNTH_SERVICE_STATE=$(systemctl is-active fluidsynth)
RR_KODI_MUTE_STATE=/var/run/kodi-service-muted
RR_KODI_SERVICE_STATE=$(systemctl is-active kodi)
RR_USLEEP_DELAY=500000

# Set functions
kodi_cleanup_mute_state() {
  if [ -f "${RR_KODI_MUTE_STATE}" ]; then
    rm "${RR_KODI_MUTE_STATE}"
  fi
}

kodi_service_mute() {
  kodi-send --action="RunScript(/usr/bin/kodi-service-mute.py)" > /dev/null
  echo "rr-config-script: Kodi service muted"
  touch ${RR_KODI_MUTE_STATE}
}

kodi_service_unmute() {
  kodi-send --action="RunScript(/usr/bin/kodi-service-unmute.py)" > /dev/null
  echo "rr-config-script: Kodi service unmuted"
  kodi_cleanup_mute_state
}

kodi_service_start() {
  kodi_cleanup_mute_state
  if [ ! "${RR_FLUIDSYNTH_SERVICE_STATE}" = "active" ]; then
    usleep "${RR_USLEEP_DELAY}"
    systemctl start kodi
  else
    fluidsynth_service_stop
    usleep "${RR_USLEEP_DELAY}"
    pulseaudio_sink_unload
    wait $(pidof pactl)
    usleep "${RR_USLEEP_DELAY}"
    systemctl start kodi
  fi
  echo "rr-config-script: Kodi service starting"
}

kodi_service_stop() {
  kodi_cleanup_mute_state
  if [ "${1}" = "forceALSA" ]; then
    systemctl stop kodi
    wait $(pidof kodi.bin)
    systemctl reset-failed kodi
    echo "rr-config-script: Kodi service stopped & force ALSA backend"
  else
    systemctl stop kodi
    wait $(pidof kodi.bin)
    systemctl reset-failed kodi
    echo "rr-config-script: Kodi service stopped"
    usleep "${RR_USLEEP_DELAY}"
    pulseaudio_sink_load
    usleep "${RR_USLEEP_DELAY}"
    fluidsynth_service_start
  fi
}

# Command line interface
case ${1} in
  --info)
    echo -e "Basic service & audio config states:\n"
    echo    "  Kodi service                  : "$(systemctl is-active kodi)
    echo -e "  Selected audio device         : "${RR_AUDIO_DEVICE}"\n"
    echo    "  PulseAudio service            : "$(systemctl is-active pulseaudio)
    echo    "  PulseAudio module-udev-detect : "${RR_PA_UDEV}
    echo    "  PulseAudio sink               : "$(pactl list sinks short)
    echo    "  PulseAudio tsched state       : "${RR_PA_TSCHED}
    echo -e "  PulseAudio volume             : "${RR_AUDIO_VOLUME}"%\n"
    echo    "  FluidSynth service            : "$(systemctl is-active fluidsynth)
    ;;
  --mute)
    if [ "${RR_KODI_SERVICE_STATE}" = "active" ] && [ ! -f "${RR_KODI_MUTE_STATE}" ]; then
      kodi_service_mute
    else
      echo "rr-config-script: Kodi service was already muted or isn't running"
    fi
    ;;
  --unmute)
    if [ "${RR_KODI_SERVICE_STATE}" = "active" ] && [ -f "${RR_KODI_MUTE_STATE}" ]; then
      kodi_service_unmute
    else
      echo "rr-config-script: Kodi service was not muted or isn't running"
    fi
    ;;
  --start)
    if [ ! "${RR_KODI_SERVICE_STATE}" = "active" ]; then
      kodi_service_start
    else
      echo "rr-config-script: Kodi service was already started"
    fi
    ;;
  --stop)
    if [ "${RR_KODI_SERVICE_STATE}" = "active" ]; then
      kodi_service_stop ${2}
    else
      echo "rr-config-script: Kodi service was already stopped"
    fi
    ;;
  *)
    echo "Usage:" 
    echo -e "  ${0} --[mute|unmute|start|stop] [forceALSA]\n"
    echo "Kodi service options:"
    echo "  --info           - lists a brief summary of service & config states"
    echo "  --mute           - mutes   Kodi audio & stopps video player"
    echo "  --unmute         - unmutes Kodi audio"
    echo "  --start          - starts  Kodi service"
    echo "  --stop           - stops   Kodi service & starts audio services depending on configured backend"
    echo -e "  --stop forceALSA - stops   Kodi service & forces ALSA audio"
    ;;
esac
