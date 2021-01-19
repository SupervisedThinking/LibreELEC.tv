## LibreELEC-RR pre-10.x
---
**Project threads**

*English*

* [LibreELEC-RR 9.x [ Emulationstation | Retroarch | DolphinQT | Moonlight | Chrome | Spotify | MakeMKV ]](https://forum.libreelec.tv/thread/12662-libreelec-9-0-reborn-remix-emulationstation-retroarch-dolphinqt-chrome-spotify-w/)

*German*

* [LibreELEC-RR 9.x [ Emulationstation | Retroarch | DolphinQT | Moonlight | Chrome | Spotify | MakeMKV ]](https://www.kodinerds.net/index.php/Thread/62933-LibreELEC-9-0-Reborn-Remix-Emulationstation-Retroarch-DolphinQT-Moonlight-Chrome/)

---
**Currently supported & unsupported devices**

*Supported:*

* Generic AMD & Intel systems with IGP and/or discrete AMD or Nvidia GPU
* Raspberry Pi 2B, 3B, 3B+

*WIP:*

* Amlogic S905 | AMLGXL
* Rockchip Rk3399 - ROCKPro64

*Currently unsupported:*

* other Rockchip based devices -> need a testing device first

---
**Basics**

* [LibreELEC 10.x-devel](https://github.com/LibreELEC/LibreELEC.tv) | pre-10
* [Kodi 19](https://github.com/xbmc/xbmc) - v19.0b1
* [Linux 5.10](https://www.kernel.org/) - 5.10.5
---
**Addons & tools for generic builds**

* [Google Chrome](https://www.google.de/chrome/index.html) - latest | autoupdate script
* [Spotify](https://www.spotify.com/nl/download/linux/) - latest | autoupdate script
---
**Minor features**

* Updated "51-these-are-not-joysticks.rules" udev rules for input devices
* Increased system partion size to 1024MB for new installations
---
**Updated video driver versions**

* [AMDGPU](https://cgit.freedesktop.org/xorg/driver/xf86-video-amdgpu/) - v19.1.0
* [ATI](https://cgit.freedesktop.org/xorg/driver/xf86-video-ati) - v19.1.0
* [Intel-video](https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/) - git a511f22
* [Intel](https://downloadcenter.intel.com/download/28087/Linux-Processor-Microcode-Data-File) - µcode 2018-08-07a
* [Mesa 3D](https://www.mesa3d.org/) - v20.3.2
* [Nvidia](https://www.nvidia.com/Download/driverResults.aspx/134859/en-us) - v460.32.03
* [Nvidia-legacy](https://www.nvidia.com/Download/driverResults.aspx/135161/en-us) - v340.108
---
**Updated daemons / backends**

* [GCC](https://gcc.gnu.org/gcc-10/changes.html) - v10.2
* [glibc](https://sourceware.org/glibc/wiki/Release/2.32) - v2.32
* [LLVM](https://llvm.org/) - v11.0.1
* [Vulkan-Loader](https://github.com/KhronosGroup/Vulkan-Loader) - v1.2.166
* [openssl](https://www.openssl.org/source/) - v1.1.1i
* [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) - 14.0
* [Samba](https://www.samba.org/samba/history/samba-4.9.1.html) - v4.13.2
* [SDL2](https://github.com/spurious/SDL-mirror) - git eebad73 | v2.0.14
* [systemd](https://github.com/systemd/systemd) - v247
* [Qt](https://wiki.qt.io/Qt_5.12_Release) - v5.15.5
* [Xorg-Server](https://cgit.freedesktop.org/xorg/xserver/log/) - v1.20.10
---
**Sysutils**

* [mesa-demos](https://cgit.freedesktop.org/mesa/demos/) - git 317f67f | 8.4.0
* [sdl-jstest](https://gitlab.com/sdl-jstest/sdl-jstest) - git 53b89cc2 | v0.2.1
* [spectre-meltdown-checker](https://github.com/speed47/spectre-meltdown-checker) - git c705afe | v0.44
* [Skyscraper by Lars Muldjord](https://github.com/muldjord/skyscraper/releases) - v3.6.6
* [vulkan-tools](https://github.com/KhronosGroup/Vulkan-Tools) -git 4951cdb | 1.2.165
---
**Emulator Frontends**

* [Emulationstation-Retropie](https://github.com/RetroPie/EmulationStation) - v2.9.4
* [Pegasus-Frontend](http://pegasus-frontend.org/) - weekly2020w51
* [RetroArch](https://github.com/libretro/RetroArch) - v1.9.0
---
**Emulators included in all builds**

*  [dosbox-sdl2](https://github.com/duganchen/dosbox) - git d4380b0 | r4156 | DOS
*  [hatari](https://github.com/hatari/hatari) - git 50bf142 | v2.2.1+ | Atari ST/STE/TT/Falcon
*  [moonlight-embedded](https://github.com/irtimmer/moonlight-embedded) - git 212eac63 | v2.4.10 | NVIDIA GameStream client
*  [PPSSPP-SDL](https://github.com/hrydgard/ppsspp) - git 4b124a7 | v1.8.0 / v1.7.5 for ARM | Sony PSP
*  [libretro-2048](https://github.com/libretro/libretro-2048) - git 8284300 | 2048
*  [libretro-atari800](https://github.com/libretro/libretro-atari800) - git b3931bb | Atari 5200
*  [libretro-beetle-dc](https://github.com/libretro/beetle-dc) - git d9f44d0 | Sega Dreamcast
*  [libretro-beetle-pce-fast](https://github.com/libretro/beetle-pce-fast-libretro) - git  7f6f061 | PC-Engine
*  [libretro-beetle-wswan](https://github.com/libretro/beetle-wswan-libretro) - git b231cff | Bandai WonderSwan
*  [libretro-blueMSX](https://github.com/libretro/blueMSX-libretro) - git 4be0a24 | MSX
*  [libretro-chailove](https://github.com/libretro/libretro-chailove) - v0.31.0 | 2D Game Framework with ChaiScript
*  [libretro-desmume](https://github.com/libretro/desmume) - git 3101540 | Nintendo DS
*  [libretro-dosbox](https://github.com/libretro/dosbox-libretro) - git 8f2d731 | DOS
*  [libretro-fbneo](https://github.com/libretro/fbneo) - git 189b99f | Multiple Arcade Machine Emulator
*  [libretro-fceumm](https://github.com/libretro/libretro-fceumm) - git e4de631 | Nintendo Entertainment System
*  [libretro-fuse](https://github.com/libretro/fuse-libretro) - git 69a4442 | ZX Spectrum
*  [libretro-gambatte](https://github.com/libretro/gambatte-libretro) - git 611cbfd | Nintendo Game Boy (Color)
*  [libretro-genplus](https://github.com/libretro/Genesis-Plus-GX) - git 53e043d | Sega Mega Drive
*  [libretro-mame2003-plus](https://github.com/libretro/mame2003-plus-libretro) - git c59c1f7 | Romset 0.78 | Multiple Arcade Machine Emulator
*  [libretro-mgba](https://github.com/mgba-emu/mgba) - git bf8c1d1 | 0.7.1+ | Nintendo Game Boy Advance
*  [libretro-mrboom](https://github.com/libretro/mrboom-libretro) - git 7f18b80a | v4.7+ | Bomberman clone
*  [libretro-mupen64plus](https://github.com/libretro/mupen64plus-libretro) - git 501d298 | Nintendo N64
*  [libretro-mupen64plus-nx](https://github.com/libretro/mupen64plus-libretro-nx) - git 504ec2c | Nintendo N64
*  [libretro-nestopia](https://github.com/libretro/nestopia) - git 44800c5 | Nintendo Entertainment System
*  [libretro-pcsx-rearmed](https://github.com/libretro/pcsx_rearmed) - git e1d8eb0 | Sony Playstation
*  [libretro-prboom](https://github.com/libretro/libretro-prboom) - git 5371c88 | Doom Clone
*  [libretro-scummvm](https://github.com/libretro/scummvm) - git d6fb141 | Engine for LucasArts adventure games
*  [libretro-snes9x](https://github.com/libretro/snes9x) - git e5ee711 | v1.59.2 | Nintendo Super Nintendo Entertainment System
*  [libretro-stella](https://github.com/libretro/stella-libretro) - git 3ed8154 | Atari 2600
*  [libretro-tyrquake](https://github.com/libretro/tyrquake) - git 7d18c40 | Quake Clone
---
**Emulators included in generic x86-64 builds**

*  [citra](https://github.com/citra-emu/citra) - git daeba65 | QT GUI | Nintendo 3DS
*  [Dolphin](https://de.dolphin-emu.org/?cr=de) - r5.0-10289 | [Qt GUI](https://de.dolphin-emu.org/blog/2018/02/03/dolphin-progress-report-january-2018/) | Nintendo Wii / Gamecube
*  [fs-uae](https://fs-uae.net/) - git 3d6a8dc | 2.9.7dev4 | Commodore Amiga
*  [m64p](https://m64p.github.io/) - git bcbef77 | Nintendo N64
*  [moonlight-qt](https://github.com/moonlight-stream/moonlight-qt) - v1.0.1 | NVIDIA GameStream client
*  [PCSX2 ](https://github.com/PCSX2/pcsx2) - git 5b9e93c | v1.5.0-dev | Docker addon needed | Sony PlayStation 2
*  [Vice](http://vice-emu.sourceforge.net/index.html#vice) - v3.3-release | Commodore C64
*  [libretro-beetle-psx](https://github.com/libretro/beetle-psx-libretro) - git c20eac9 | Sony Playstation
*  [libretro-beetle-saturn](https://github.com/libretro/beetle-saturn-libretro) - git 052f6d6 | Sega Saturn
*  [libretro-bsnes-mercury](https://github.com/libretro/bsnes-mercury) git 4e221df | balanced & accuracy | Nintendo Super Nintendo Entertainment System
*  [libretro-citra](https://github.com/libretro/citra) - git a0c222c | Nintendo 3DS
*  [libretro-dolphin](https://github.com/libretro/dolphin) - git 1d973f4 | Nintendo Wii / Gamecube
*  [libretro-kronos](https://github.com/libretro/yabause/tree/kronos) - git 88d668c | Sega Saturn
*  [libretro-mame2016](https://github.com/libretro/mame2016-libretro) - git e06d731 | Romset 0.174 | Multiple Arcade Machine Emulator
*  [libretro-mesen](https://github.com/SourMesen/Mesen) - git 96851e6 | v0.9.7 | Nintendo Entertainment System
*  [lr-nSide](https://github.com/libretro/nSide) - git 5e965d0 | based on higan v106 | Nintendo Super Nintendo Entertainment System
*  [libretro-parallel-n64](https://github.com/libretro/parallel-n64) - git 7e204b0 | Nintendo N64
*  [libretro-ppsspp](https://github.com/hrydgard/ppsspp) - git 4b124a7 | v1.8.0 | Sony PSP
*  [libretro-yabasanshiro](https://github.com/libretro/yabause/tree/yabasanshiro) - git f702466 | Sega Saturn
---
**Emulators included in Amlogic S905 | AMLGXL builds**

*  [amiberry](https://github.com/midwan/amiberry) - git 780c020 | v2.25+ | Commodore Amiga
*  [libretro-mame2010](https://github.com/libretro/mame2010-libretro) - git c87309d | Romset 0.139 | Multiple Arcade Machine Emulator
*  [libretro-snes9x2010](https://github.com/libretro/snes9x2010) - git d857a31 | Nintendo Super Nintendo Entertainment System
*  [libretro-vice](https://github.com/libretro/vice-libretro) - git b35a177 | Commodore C64
*  [libretro-yabause](https://github.com/libretro/yabause)  - git aa15301 | Sega Saturn
---
**Emulators included in RK3399 builds**

*  [amiberry](https://github.com/midwan/amiberry) - git 780c020 | v2.25+ | Commodore Amiga
*  [libretro-mame2016](https://github.com/libretro/mame2016-libretro) - git e06d731 | Romset 0.174 | Multiple Arcade Machine Emulator
*  [libretro-snes9x2010](https://github.com/libretro/snes9x2010) - git d857a31 | Nintendo Super Nintendo Entertainment System
*  [libretro-vice](https://github.com/libretro/vice-libretro) - git b35a177 | Commodore C64
*  [libretro-yabasanshiro](https://github.com/libretro/yabause/tree/yabasanshiro)  - git f702466 | Sega Saturn

---
**Emulators included in RPi2 & RPi3 builds**

*  [amiberry](https://github.com/midwan/amiberry) - git 780c020 | v2.25+ | Commodore Amiga
*  [libretro-mame2010](https://github.com/libretro/mame2010-libretro) - git c87309d | Romset 0.139 | Multiple Arcade Machine Emulator
*  [libretro-snes9x2010](https://github.com/libretro/snes9x2010) - git d857a31 | Nintendo Super Nintendo Entertainment System
*  [libretro-vice](https://github.com/libretro/vice-libretro) - git b35a177 | Commodore C64
*  [libretro-yabause](https://github.com/libretro/yabause)  - git aa15301 | Sega Saturn

---
**Builds systems**

I uses VirtualBox v6.0.4 to run a Linux Mint 19 Mate VM as building system and a Thinkpad X220 with Linux Mint 19.1 as well. So this distribution should be suitable for you too. For further information see [LibreELEC Wiki / Compile](https://wiki.libreelec.tv/compile).

---
**Build dependencies**

This should be handled automatically by the build script.

---
**Download package source code (optional)**

This command starts the download of all the source code packages you'll need for the build process. You can skip this and the source code is downloaded right before each package is build.

For generic x86-64 Intel & AMD CPU use:
```
PROJECT=Generic ARCH=x86_64 tools/download-tool
```
For Raspberry Pi (RPi2 & RPi3) use:
```
PROJECT=RPi DEVICE=RPi2 ARCH=arm tools/download-tool
```
---

---
**Dashboard (optional)**

This command starts a dashboard that gives you a brief overview which package is currently unpacked, build, installed etc.

For generic x86-64 Intel & AMD CPU use:
```
PROJECT=Generic ARCH=x86_64 tools/dashboard
```
For Raspberry Pi (RPi2 & RPi3) use:
```
PROJECT=RPi DEVICE=RPi2 ARCH=arm tools/dashboard
```
---

**Build commands Generic**

For generic x86-64 Intel & AMD CPU use:
```
PROJECT=Generic ARCH=x86_64 BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=9.80 make image
```

**Build commands Raspberry**

For Raspberry Pi (RPi2 & RPi3) use:
```
PROJECT=RPi DEVICE=RPi2 ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=9.80 make image
```

**Build commands Amlogic**

For Amlogic S905/S905X AMLGXL use:
```
PROJECT=Amlogic DEVICE=AMLGXL ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=9.80 make image
```

**Build commands Rockchip**

For ROCKPro64 use:
```
PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=rockpro64 BUILD_PERIODIC=RR BUILDER_NAME=5schatten BUILDER_VERSION=9.80 make image
```

**Build commands single packages / addons**

To build single packages use:
```
scripts/build "package"
```
In example for package linux:
```
PROJECT=Generic ARCH=x86_64 scripts/build linux
```
---

**Clean up**

In case the build process fails try this and build again:

```
scripts/clean "package"
```
i.e. this cleans the linux package:
```
PROJECT=Generic ARCH=x86_64 scripts/clean linux
```

If you want to start a clean build:

```
make clean
```
If you want to start a clean build without buildcache:

```
make distclean
```
---
**Issues**

Visit the [LibreELEC 9 Remix issue page](https://github.com/5schatten/LibreELEC.tv/issues) or [LibreELEC 9.0 Reborn Remix [Emulationstation|Retroarch|DolphinQT |Chrome|Spotify]](https://forum.libreelec.tv/thread/12662-libreelec-9-0-reborn-remix-emulationstation-retroarch-dolphinqt-chrome-spotify-w/)  for issues pertaining to this specific fork. 

For everything else, see the [LibreELEC Forum](https://forum.libreelec.tv).

---
**Original README below:**

---
**LibreELEC**

LibreELEC is a 'Just enough OS' Linux distribution for running the award-winning [Kodi](https://kodi.tv) software on popular mediacentre hardware. LibreELEC is a conservative fork of the popular [OpenELEC](http://openelec.tv) project with a stronger focus on pre-release testing and post-release change management. Further information on the project can be found on the [LibreELEC website](https://libreelec.tv).

**Issues & Support**

Please report issues via the [LibreELEC forum: Bug Reports](https://forum.libreelec.tv/forum-35.html). Please ask support questions in the [LibreELEC forum: Help & Support](https://forum.libreelec.tv/forum-3.html) or ask a member of project staff in the #libreelec IRC channel on Freenode.

**Donations**

Contributions towards current project funding goals can be sent via PayPal to donations@libreelec.tv

**License**

LibreELEC original code is released under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html).

**Copyright**

As LibreELEC includes code from many upstream projects it includes many copyright owners. LibreELEC makes NO claim of copyright on any upstream code. However all original LibreELEC authored code is copyright LibreELEC.tv. Patches to upstream code have the same license as the upstream project, unless specified otherwise. For a complete copyright list please checkout the source code to examine license headers. Unless expressly stated otherwise all code submitted to the LibreELEC project (in any form) is licensed under [GPLv2](https://www.gnu.org/licenses/gpl-2.0.html) and copyright is donated to LibreELEC.tv. This approach allows the project to stay manageable in the long term by giving us freedom to maintain the code as part of the whole without the management overhead of preserving contact with every submitter, e.g. GPLv3. You are absolutely free to retain copyright. To retain copyright simply add a copyright header to each submitted code page. If you submit code that is not your own work it is your responsibility to place a header stating the copyright.
