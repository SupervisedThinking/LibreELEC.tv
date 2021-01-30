## LibreELEC-RR 10.dev
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

*WIP:*

* Amlogic AMLGXL / AMLG12B
* Raspberry Pi 4
* Rockchip Rk3399 - ROCKPro64
---
**Basics**

* [LibreELEC 10.x-devel](https://github.com/LibreELEC/LibreELEC.tv) | pre-10
* [Kodi 19](https://github.com/xbmc/xbmc) - v19.0b1
* [Linux 5.10](https://www.kernel.org/) - 5.10.11
---
**Addons & tools for generic builds**

* [Brave Webbrowser](https://brave.com/) - latest | autoupdate script
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
* [Mesa 3D](https://www.mesa3d.org/) - v21.0-rc3
* [Nvidia](https://www.nvidia.com/de-de/drivers/unix/) - 460.39
* [Nvidia-legacy](https://www.nvidia.com/de-de/drivers/unix/) - 340.108
---
**Updated daemons / backends**

* [GCC](https://gcc.gnu.org/gcc-10/changes.html) - v10.2
* [glibc](https://sourceware.org/glibc/wiki/Release/2.32) - v2.32
* [LLVM](https://llvm.org/) - v11.0.1
* [Vulkan-Loader](https://github.com/KhronosGroup/Vulkan-Loader) - v1.2.166
* [openssl](https://www.openssl.org/source/) - v1.1.1i
* [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) - 14.2
* [Samba](https://www.samba.org/samba/history/samba-4.9.1.html) - v4.13.4
* [SDL2](https://github.com/spurious/SDL-mirror) - git eebad73 | v2.0.14
* [systemd](https://github.com/systemd/systemd) - v247
* [Qt](https://wiki.qt.io/Qt_5.15_Release) - v5.15.2
* [Xorg-Server](https://cgit.freedesktop.org/xorg/xserver/log/) - v1.20.10
---
**Sysutils**

* [mesa-demos](https://cgit.freedesktop.org/mesa/demos/) - git 317f67f | 8.4.0
* [sdl-jstest](https://gitlab.com/sdl-jstest/sdl-jstest) - git 53b89cc2 | v0.2.1
* [spectre-meltdown-checker](https://github.com/speed47/spectre-meltdown-checker) - v0.44
* [Skyscraper by Lars Muldjord](https://github.com/muldjord/skyscraper/releases) - v3.6.7
* [vulkan-tools](https://github.com/KhronosGroup/Vulkan-Tools) -git 4951cdb | 1.2.166
---
**Emulator Frontends**

* [Emulationstation-Retropie](https://github.com/RetroPie/EmulationStation) - v2.9.4
* [Pegasus-Frontend](http://pegasus-frontend.org/) - weekly2020w51
* [RetroArch](https://github.com/libretro/RetroArch) - v1.9.0
---
**Emulators included in all builds**

*  [dosbox-staging](https://github.com/dosbox-staging/dosbox-staging) - DOS
*  [hatari](https://github.com/hatari/hatari) - Atari ST/STE/TT/Falcon
*  [moonlight-qt](https://github.com/moonlight-stream/moonlight-qt) - NVIDIA GameStream client
*  [PPSSPP-SDL](https://github.com/hrydgard/ppsspp) - Sony PSP
*  [libretro-2048](https://github.com/libretro/libretro-2048) - 2048
*  [libretro-atari800](https://github.com/libretro/libretro-atari800) - Atari 5200
*  [libretro-beetle-dc](https://github.com/libretro/beetle-dc) - Sega Dreamcast
*  [libretro-beetle-pce-fast](https://github.com/libretro/beetle-pce-fast-libretro) - PC-Engine
*  [libretro-beetle-wswan](https://github.com/libretro/beetle-wswan-libretro) - Bandai WonderSwan
*  [libretro-blueMSX](https://github.com/libretro/blueMSX-libretro) - MSX
*  [libretro-chailove](https://github.com/libretro/libretro-chailove) - 2D Game Framework with ChaiScript
*  [libretro-desmume](https://github.com/libretro/desmume) - Nintendo DS
*  [libretro-dosbox-pure](https://github.com/libretro/dosbox-pure) - git 8f2d731 | DOS
*  [libretro-fbneo](https://github.com/libretro/fbneo) - Multiple Arcade Machine Emulator
*  [libretro-fceumm](https://github.com/libretro/libretro-fceumm) - Nintendo Entertainment System
*  [libretro-fuse](https://github.com/libretro/fuse-libretro) - ZX Spectrum
*  [libretro-gambatte](https://github.com/libretro/gambatte-libretro) - Nintendo Game Boy (Color)
*  [libretro-genplus](https://github.com/libretro/Genesis-Plus-GX) - Sega Mega Drive
*  [libretro-mame2003-plus](https://github.com/libretro/mame2003-plus-libretro) - Multiple Arcade Machine Emulator | Romset 0.78
*  [libretro-mgba](https://github.com/mgba-emu/mgba) - Nintendo Game Boy Advance
*  [libretro-mrboom](https://github.com/libretro/mrboom-libretro) - Bomberman clone
*  [libretro-mupen64plus-nx](https://github.com/libretro/mupen64plus-libretro-nx) - Nintendo N64
*  [libretro-nestopia](https://github.com/libretro/nestopia) - Nintendo Entertainment System
*  [libretro-pcsx-rearmed](https://github.com/libretro/pcsx_rearmed) - Sony Playstation
*  [libretro-prboom](https://github.com/libretro/libretro-prboom) - Doom engine
*  [libretro-scummvm](https://github.com/libretro/scummvm) - Engine for LucasArts adventure games
*  [libretro-snes9x](https://github.com/libretro/snes9x) - Nintendo Super Nintendo Entertainment System
*  [libretro-stella](https://github.com/libretro/stella-libretro) - Atari 2600
*  [libretro-tyrquake](https://github.com/libretro/tyrquake) - Quake engine
---
**Emulators included in generic x86-64 builds**

*  [citra](https://github.com/citra-emu/citra) - Nintendo 3DS
*  [Dolphin](https://de.dolphin-emu.org/?cr=de) - Nintendo Wii / Gamecube
*  [fs-uae](https://fs-uae.net/) - Commodore Amiga
*  [m64p](https://m64p.github.io/) - Nintendo N64
*  [PCSX2 ](https://github.com/PCSX2/pcsx2) - Sony PlayStation 2
*  [Vice](http://vice-emu.sourceforge.net/index.html#vice) - Commodore C64
*  [libretro-beetle-psx](https://github.com/libretro/beetle-psx-libretro) - Sony Playstation
*  [libretro-beetle-saturn](https://github.com/libretro/beetle-saturn-libretro) - Sega Saturn
*  [libretro-bsnes-mercury](https://github.com/libretro/bsnes-mercury) - Nintendo Super Nintendo Entertainment System | balanced & accuracy
*  [libretro-citra](https://github.com/libretro/citra) - Nintendo 3DS
*  [libretro-dolphin](https://github.com/libretro/dolphin) - Nintendo Wii / Gamecube
*  [libretro-kronos](https://github.com/libretro/yabause/tree/kronos) - Sega Saturn
*  [libretro-mame2016](https://github.com/libretro/mame2016-libretro) - Multiple Arcade Machine Emulator | Romset 0.174
*  [libretro-mesen](https://github.com/SourMesen/Mesen) - Nintendo Entertainment System
*  [lr-nSide](https://github.com/libretro/nSide) - Nintendo Super Nintendo Entertainment System
*  [libretro-parallel-n64](https://github.com/libretro/parallel-n64) - Nintendo N64
*  [libretro-ppsspp](https://github.com/hrydgard/ppsspp) - Sony PSP
*  [libretro-yabasanshiro](https://github.com/libretro/yabause/tree/yabasanshiro) - Sega Saturn
---
**Emulators included in Amlogic S905 | AMLGXL builds**

*  [amiberry](https://github.com/midwan/amiberry) - Commodore Amiga
*  [libretro-mame2010](https://github.com/libretro/mame2010-libretro) - Multiple Arcade Machine Emulator | Romset 0.139
*  [libretro-snes9x2010](https://github.com/libretro/snes9x2010) - Nintendo Super Nintendo Entertainment System
*  [libretro-vice](https://github.com/libretro/vice-libretro) - Commodore C64
*  [libretro-yabause](https://github.com/libretro/yabause)  - Sega Saturn
---
**Emulators included in RK3399 builds**

*  [amiberry](https://github.com/midwan/amiberry) - Commodore Amiga
*  [libretro-mame2010](https://github.com/libretro/mame2010-libretro) - Multiple Arcade Machine Emulator | Romset 0.139
*  [libretro-snes9x2010](https://github.com/libretro/snes9x2010) - Nintendo Super Nintendo Entertainment System
*  [libretro-vice](https://github.com/libretro/vice-libretro) - Commodore C64
*  [libretro-yabause](https://github.com/libretro/yabause)  - Sega Saturn

---
**Emulators included in RPi4 builds**

*  [amiberry](https://github.com/midwan/amiberry) - Commodore Amiga
*  [libretro-mame2010](https://github.com/libretro/mame2010-libretro) - Multiple Arcade Machine Emulator | Romset 0.139
*  [libretro-snes9x2010](https://github.com/libretro/snes9x2010) - Nintendo Super Nintendo Entertainment System
*  [libretro-vice](https://github.com/libretro/vice-libretro) - Commodore C64
*  [libretro-yabause](https://github.com/libretro/yabause)  - Sega Saturn

---
**Builds systems**

I uses VirtualBox to run a Linux Mint 20.1 Mate VM as building system and a Thinkpad X220 with Linux Mint 20.1 as well. So this distribution should be suitable for you too. For further information see [LibreELEC Wiki / Compile](https://wiki.libreelec.tv/compile).

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
For Raspberry Pi 4 use:
```
PROJECT=RPi DEVICE=RPi4 ARCH=arm tools/download-tool
```
---

---
**Dashboard (optional)**

This command starts a dashboard that gives you a brief overview which package is currently unpacked, build, installed etc.

For generic x86-64 Intel & AMD CPU use:
```
PROJECT=Generic ARCH=x86_64 tools/dashboard
```
For Raspberry Pi 4 use:
```
PROJECT=RPi DEVICE=RPi4 ARCH=arm tools/dashboard
```
---

**Build commands Generic**

For generic x86-64 Intel & AMD CPU use:
```
PROJECT=Generic ARCH=x86_64 BUILD_PERIODIC=RR BUILDER_NAME=Your_Name BUILDER_VERSION=9.80 make image
```

**Build commands Raspberry**

For Raspberry Pi 4 use:
```
PROJECT=RPi DEVICE=RPi4 ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=Your_Name BUILDER_VERSION=9.80 make image
```

**Build commands Amlogic**

For universal Amlogic AMLGXL images use:
```
PROJECT=Amlogic DEVICE=AMLGXL ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=Your_Name BUILDER_VERSION=9.80 make image
```

For Amlogic S922X/A311D AMLG12B use:
```
PROJECT=Amlogic DEVICE=AMLG12B ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=Your_Name BUILDER_VERSION=9.80 make image
```

**Build commands Rockchip**

For ROCKPro64 use:
```
PROJECT=Rockchip DEVICE=RK3399 ARCH=arm UBOOT_SYSTEM=rockpro64 BUILD_PERIODIC=RR BUILDER_NAME=Your_Name BUILDER_VERSION=9.80 make image
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
