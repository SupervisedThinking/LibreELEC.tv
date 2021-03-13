## LibreELEC-RR 10.0
---
**Preliminary project threads**

*English*

* [LibreELEC-RR 10.x [ Brave | Spotify | Moonlight | Emulationstation | Retroarch | Pegasus-Frontend]](https://forum.libreelec.tv/thread/12662-libreelec-9-0-reborn-remix-emulationstation-retroarch-dolphinqt-chrome-spotify-w/)

*German*

* [LibreELEC-RR 10.x [ Brave | Spotify | Moonlight | Emulationstation | Retroarch | Pegasus-Frontend]](https://www.kodinerds.net/index.php/Thread/62933-LibreELEC-9-0-Reborn-Remix-Emulationstation-Retroarch-DolphinQT-Moonlight-Chrome/)

---
**Downloads**
| Project | Links |
| ------ | ----- |
| Amlogic | [Google Drive](https://drive.google.com/drive/folders/1EwOjNcyR7l4qYds62F7NIHePlZ_A14Na?usp=sharing) |
| Generic | [Google Drive](https://drive.google.com/drive/folders/1oMAAKESTaaZ_kc8-1iCBvpxDAdJp0B7H?usp=sharing) |
| Rockchip | [Google Drive](https://drive.google.com/drive/folders/1AyDf37iHSEPsduSZJ4OOhQyJRTPsQG83?usp=sharing) |
| RPi | [Google Drive](https://drive.google.com/drive/folders/1ECdRmw_cxEvhngdIrqsSQD0zssTK2IoI?usp=sharing) |

---
**Currently supported & WIP devices**

| Project | Device | SoC / CPU | SBC | Build tested | Run tested | State | Known issues |
| ------ | ------- | --------- | --- | ------------ | ---------- | ----- | ------------ |
| Amlogic | AMLG12B | [A311D](http://linux-meson.com/doku.php#supported_wip_soc_families) | VIM3 | x | x | alpha | audio & videodecoder quirks*, low Mesa 3D performance** |
| Amlogic | AMLGX | [S905X](http://linux-meson.com/doku.php#supported_wip_soc_families) | VIM1 | x | x | alpha | audio & videodecoder quirks*, low Mesa 3D performance** |
| Generic | - | AMD & Intel | - | x | x | stable | random silent audio in ES with PA backend, should be solved by restarting the emulator/ES |
| Rockchip | RK3399 | [RK3399](http://opensource.rock-chips.com/wiki_Status_Matrix#Mainline_Kernel_Status_Matrix) | ROCKPro64 | x | x | beta stable | low Mesa 3D performance** |
| RPi | RPi4 | bcm2711 | RPi4 | x | - | ? | ? |

*Known issue of the mainline Linux kernel
**Known issue of the Mesa 3D panfrost driver

---
**Basics**

* [LibreELEC 10.0](https://github.com/LibreELEC/LibreELEC.tv)
* [Kodi 19](https://github.com/xbmc/xbmc)

| Project | Linux kernel | Mesa 3D | xf86-video-nvidia | xf86-video-nvidia-legacy | Vulkan-Loader |
| ------ | ------------- | ------- | ------ | ------------- | ------ |
| Amlogic | [Linux 5.11.y](https://www.kernel.org/) | [21.1.0-dev](https://github.com/mesa3d/mesa) | - | - | - |
| Generic | [Linux 5.10.y](https://www.kernel.org/) | [21.0.0](https://github.com/mesa3d/mesa/releases/tag/mesa-21.0.0) | [460.56](https://www.nvidia.de/Download/driverResults.aspx/170812/de) | [340.108](https://www.nvidia.de/Download/driverResults.aspx/156190/de) | [v1.2.172](https://github.com/KhronosGroup/Vulkan-Loader/releases/tag/v1.2.172) |
| Rockchip | [Linux 5.10.y](https://www.kernel.org/) | [21.1.0-dev](https://github.com/mesa3d/mesa) | - | - | - |
| RPi | [Linux 5.10.y](https://www.kernel.org/) | [21.1.0-dev](https://github.com/mesa3d/mesa) | - | - | - |

---
**Addons & tools for generic builds**

* [Brave Webbrowser](https://brave.com/) - latest | autoupdate script
* [Spotify](https://www.spotify.com/nl/download/linux/) - latest | autoupdate script
---
**Minor features**

* Updated [udev-joystick-blacklist](https://github.com/denilsonsa/udev-joystick-blacklist) udev rules for input devices
* Increased system partion size to 1024MB for new installations
---
**Addons, scripts & sysutils**

* [evtest](https://github.com/freedesktop-unofficial-mirror/evtest)
* [glmark2](https://github.com/glmark2/glmark2)
* [mesa-demos](https://cgit.freedesktop.org/mesa/demos)
* [SDL_GameControllerDB](https://github.com/gabomdq/SDL_GameControllerDB)
* [sdl-jstest](https://gitlab.com/sdl-jstest/sdl-jstest)
* [spectre-meltdown-checker](https://github.com/speed47/spectre-meltdown-checker)
* [Skyscraper by Lars Muldjord](https://github.com/muldjord/skyscraper/releases)
* [vulkan-tools](https://github.com/KhronosGroup/Vulkan-Tools)
---
**Emulator Frontends**

| Frontend | Version | Included Themes | Documentation & Guide |
| -------- | ------- | --------------- | --------------------- |
| [Emulationstation-Retropie](https://github.com/RetroPie/EmulationStation) | v2.9.4 |[carbon](https://github.com/SupervisedThinking/es-theme-carbon/) / [pixel](https://github.com/SupervisedThinking/es-theme-pixel) / [simple-dark](https://github.com/SupervisedThinking/es-theme-simple-dark) | [Wiki](https://retropie.org.uk/docs/EmulationStation/) |
| [Pegasus-Frontend](http://pegasus-frontend.org/) | continous | [es2-simple](https://github.com/mmatyas/pegasus-theme-es2-simple) / [gameOS](https://github.com/PlayingKarrde/gameOS) | [Wiki](https://pegasus-frontend.org/docs/) |
| [RetroArch](https://github.com/libretro/RetroArch) | v1.9.0 | - |[FAQ](https://www.retroarch.com/?page=faq) |

---
**Emulators included in all builds**

| Standalone-Emulator | Emulated System | Documentation & Guide |
| ------------------- | --------------- | --------------------- |
| [dosbox-staging](https://github.com/dosbox-staging/dosbox-staging) | DOS | [Wiki](https://github.com/dosbox-staging/dosbox-staging/wiki) |
| [hatari](https://github.com/hatari/hatari) | Atari ST/STE/TT/Falcon | [Hatari User's Manual](https://hatari.tuxfamily.org/doc/manual.html) |
| [PPSSPP](https://github.com/hrydgard/ppsspp) | Sony PSP | [Guides](https://www.ppsspp.org/guides.html) |

| Libretro-Core | Emulated System | Documentation & Guide |
| ------------- | --------------- | --------------------- |
| [2048](https://github.com/libretro/libretro-2048) | 2048 | [Libretro Docs](https://docs.libretro.com/library/2048/) |
| [atari800](https://github.com/libretro/libretro-atari800) | Atari 5200 | [Libretro Docs](https://docs.libretro.com/library/atari800/) |
| [beetle-lynx](https://github.com/libretro/beetle-lynx-libretro) | Atari Lynx | [Libretro Docs](https://docs.libretro.com/library/beetle_lynx/) |
| [beetle-pce-fast](https://github.com/libretro/beetle-pce-fast-libretro) | PC-Engine | [Libretro Docs](https://docs.libretro.com/library/beetle_pce_fast/) |
| [beetle-wswan](https://github.com/libretro/beetle-wswan-libretro) | Bandai WonderSwan | [Libretro Docs](https://docs.libretro.com/library/beetle_cygne/) |
| [blueMSX](https://github.com/libretro/blueMSX-libretro) | MSX | [Libretro Docs](https://docs.libretro.com/library/bluemsx/) |
| [chailove](https://github.com/libretro/libretro-chailove) | 2D Game Framework with ChaiScript | [Libretro Docs](https://docs.libretro.com/library/chailove/) |
| [desmume](https://github.com/libretro/desmume) | Nintendo DS | [Libretro Docs](https://docs.libretro.com/library/desmume/) |
| [dosbox-pure](https://github.com/libretro/dosbox-pure) | DOS | [Libretro Docs](https://docs.libretro.com/library/dosbox/) |
| [ecwolf](https://github.com/libretro/ecwolf) | Wolf3D (id Tech Engine) | [Libretro Docs](https://www.libretro.com/index.php/ecwolf-wolfenstein-3d-libretro-core-wip-available-today-on-windowsmaclinuxandroid/) |
| [fbneo](https://github.com/libretro/fbneo) | Multiple Arcade Machine Emulator -  Romset 1.0.0.1 | [Libretro Docs](https://docs.libretro.com/library/fbneo/) |
| [fceumm](https://github.com/libretro/libretro-fceumm) | Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/fceumm/) |
| [flycast](https://github.com/libretro/flycast) | Sega Dreamcast | [Libretro Docs](https://docs.libretro.com/library/flycast/) |
| [fuse](https://github.com/libretro/fuse-libretro) | ZX Spectrum | [Libretro Docs](https://docs.libretro.com/library/fuse/) |
| [gambatte](https://github.com/libretro/gambatte-libretro) | Nintendo Game Boy (Color) | [Libretro Docs](https://docs.libretro.com/library/gambatte/) |
| [genesis-plus-gx](https://github.com/libretro/Genesis-Plus-GX) | Sega Mega Drive | [Libretro Docs](https://docs.libretro.com/library/genesis_plus_gx/) |
| [genesis-plus-gx-wide](https://github.com/libretro/Genesis-Plus-GX-Wide) | Sega Mega Drive | [Libretro Docs](https://docs.libretro.com/library/genesis_plus_gx/) |
| [mame2003-plus](https://github.com/libretro/mame2003-plus-libretro) | Multiple Arcade Machine Emulator - Romset 0.78 | [Libretro Docs](https://docs.libretro.com/library/mame2003_plus/) |
| [mgba](https://github.com/mgba-emu/mgba) | Nintendo Game Boy Advance | [Libretro Docs](https://docs.libretro.com/library/mgba/) |
| [mrboom](https://github.com/libretro/mrboom-libretro) | Bomberman clone | [Libretro Docs](https://docs.libretro.com/library/mr_boom/) |
| [mupen64plus-nx](https://github.com/libretro/mupen64plus-libretro-nx) | Nintendo N64 | [Libretro Docs](https://docs.libretro.com/library/mupen64plus/) |
| [nestopia](https://github.com/libretro/nestopia) | Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/nestopia_ue/) |
| [opera](https://github.com/libretro/opera-libretro) | 3DO Interactive Multiplayer | [Libretro Docs](https://docs.libretro.com/library/opera/) |
| [pcsx-rearmed](https://github.com/libretro/pcsx_rearmed) | Sony Playstation | [Libretro Docs](https://docs.libretro.com/library/pcsx_rearmed/) |
| [prboom](https://github.com/libretro/libretro-prboom) | Doom (id Tech Engine) | [Libretro Docs](https://docs.libretro.com/library/prboom/) |
| [prosystem](https://github.com/libretro/prosystem-libretro) | Atari 7800 | [Libretro Docs](https://docs.libretro.com/library/prosystem/) |
| [sameboy](https://github.com/libretro/SameBoy) | Nintendo Game Boy (Color) | [Libretro Docs](https://docs.libretro.com/library/sameboy/) |
| [scummvm](https://github.com/libretro/scummvm) | Engine for LucasArts adventure games | [Libretro Docs](https://docs.libretro.com/library/scummvm/) |
| [snes9x](https://github.com/libretro/snes9x) | Nintendo Super Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/snes9x/) |
| [stella](https://github.com/libretro/stella-libretro) | Atari 2600 | [Libretro Docs](https://docs.libretro.com/library/stella/) |
| [tyrquake](https://github.com/libretro/tyrquake) | Quake (id Tech 2 Engine) | [Libretro Docs](https://docs.libretro.com/library/tyrquake/) |
| [virtualjaguar](https://github.com/libretro/virtualjaguar-libretro) | Atari Jaguar | [Libretro Docs](https://docs.libretro.com/library/virtual_jaguar/) |

| Streaming-Client | System | Documentation & Guide |
| ---------------- | ------ | --------------------- |
| [moonlight-qt](https://github.com/moonlight-stream/moonlight-qt) | NVIDIA GameStream client | [Setup-Guide](https://github.com/moonlight-stream/moonlight-docs/wiki/Setup-Guide) |

| Soundfont for MIDI support | Type |
| -------------------------- | ---- |
| [GeneralUser GS](http://schristiancollins.com/generaluser.php) | SF2 |
| [MuseScore General](https://musescore.org/de/handbook/2/soundfonts-und-sfz-dateien) | SF3 |

---
**Emulators included in Generic builds**

| Standalone-Emulator | Emulated System | Documentation & Guide |
| ------------------- | --------------- | --------------------- |
| [citra](https://github.com/citra-emu/citra) | Nintendo 3DS | [FAQ](https://citra-emu.org/wiki/faq/) |
| [Dolphin](https://de.dolphin-emu.org/?cr=de) | Nintendo Wii / Gamecube | [Wiki](https://wiki.dolphin-emu.org/index.php?title=Main_Page) |
| [fs-uae](https://fs-uae.net/) | Commodore Amiga | [Docs](https://fs-uae.net/docs) |
| [m64p](https://m64p.github.io/) | Nintendo N64 | [Wiki](https://github.com/loganmc10/m64p/wiki) |
| [OpenBOR ](https://github.com/DCurrent/openbor) | Open Beats of Rage | [Wiki](http://www.chronocrash.com/apps/wiki/obor/index.php?title=Main_Page) |
| [PCSX2 ](https://github.com/PCSX2/pcsx2) | Sony PlayStation 2 | [Wiki](https://wiki.pcsx2.net/Main_Page) |
| [RPCS3 ](https://github.com/RPCS3/rpcs3) | Sony PlayStation 3 | [Wiki](https://wiki.rpcs3.net/index.php?title=Main_Page) |
| [Vice](http://vice-emu.sourceforge.net/index.html#vice) | Commodore C64 | [User Manual](https://vice-emu.sourceforge.io/vice_toc.html) |

| Libretro-Core | Emulated System | Documentation & Guide |
| ------------- | --------------- | --------------------- |
| [beetle-psx](https://github.com/libretro/beetle-psx-libretro) | Sony Playstation | [Libretro Docs](https://docs.libretro.com/library/beetle_psx/) |
| [beetle-saturn](https://github.com/libretro/beetle-saturn-libretro) | Sega Saturn | [Libretro Docs](https://docs.libretro.com/library/beetle_saturn/) |
| [bsnes](https://github.com/libretro/bsnes) | Nintendo Super Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/bsnes_performance/) |
| [bsnes-mercury](https://github.com/libretro/bsnes-mercury) | Nintendo Super Nintendo Entertainment System - balanced & accuracy | [Libretro Docs](https://docs.libretro.com/library/bsnes_mercury_balanced/) |
| [boom3](https://github.com/libretro/boom3) | Doom3 (id Tech 4 Engine) | [FAQ](https://github.com/dhewm/dhewm3/wiki/FAQ) |
| [citra](https://github.com/libretro/citra) | Nintendo 3DS | [Libretro Docs](https://docs.libretro.com/library/citra/) |
| [dolphin](https://github.com/libretro/dolphin) | Nintendo Wii / Gamecube | [Libretro Docs](https://docs.libretro.com/library/dolphin/) |
| [duckstation](https://github.com/libretro/duckstation) | Sony Playstation | [Wiki](https://www.duckstation.org/wiki/Main_Page) |
| [kronos](https://github.com/libretro/yabause/tree/kronos) | Sega Saturn | [Libretro Docs](https://docs.libretro.com/library/yabause/) |
| [mame2016](https://github.com/libretro/mame2016-libretro) | Multiple Arcade Machine Emulator - Romset 0.174 | [Libretro Docs](https://docs.libretro.com/guides/softwarelist-getting-started/) |
| [mesen](https://github.com/SourMesen/Mesen) | Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/mesen/) |
| [nSide](https://github.com/libretro/nSide) | Nintendo Super Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/nside_balanced/) |
| [parallel-n64](https://github.com/libretro/parallel-n64) | Nintendo N64 | [Libretro Docs](https://docs.libretro.com/library/mupen64plus/) |
| [ppsspp](https://github.com/hrydgard/ppsspp) | Sony PSP | [Libretro Docs](https://docs.libretro.com/library/ppsspp/) |
| [uae](https://github.com/libretro/libretro-uae) | Commodore Amiga | [Libretro Docs](https://docs.libretro.com/library/puae/) |
| [vitaquake2](https://github.com/libretro/vitaquake2) | Quake2 (id Tech 2 Engine) | [Libretro Docs](https://www.libretro.com/index.php/vitaquake-ii-libretro-core-wip-available-soon-high-refresh-rates-in-libretro-core-games/) |
| [vitaquake3](https://github.com/libretro/vitaquake3) | Quake3 (id Tech 3 Engine) | [Libretro Docs](https://www.libretro.com/index.php/quake-3-core-ported-to-libretroretroarch-with-working-online-multiplayer-more/) |
| [yabasanshiro](https://github.com/libretro/yabause/tree/yabasanshiro) | Sega Saturn | [Libretro Docs](https://docs.libretro.com/library/yabause/) |

---
**Emulators included in Amlogic AMLG12B builds**
| Standalone-Emulator | Emulated System | Documentation & Guide |
| ------------------- | --------------- | --------------------- |
| [amiberry](https://github.com/midwan/amiberry) | Commodore Amiga | [Wiki](https://github.com/midwan/amiberry/wiki) |

| Libretro-Core | Emulated System | Documentation & Guide |
| ------------- | --------------- | --------------------- |
| [mame2010](https://github.com/libretro/mame2010-libretro) | Multiple Arcade Machine Emulator - Romset 0.139 | [Libretro Docs](https://docs.libretro.com/library/mame_2010/) |
| [mame2016](https://github.com/libretro/mame2016-libretro) | Multiple Arcade Machine Emulator - Romset 0.174 | [Libretro Docs](https://docs.libretro.com/guides/softwarelist-getting-started/) |
| [snes9x2010](https://github.com/libretro/snes9x2010) | Nintendo Super Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/snes9x_2010/) |
| [vice](https://github.com/libretro/vice-libretro) | Commodore C64 | [Libretro Docs](https://docs.libretro.com/library/vice/) |
| [yabause](https://github.com/libretro/yabause) | Sega Saturn | [Libretro Docs](https://docs.libretro.com/library/yabause/) |
---
**Emulators included in Amlogic AMLGX builds**
| Standalone-Emulator | Emulated System | Documentation & Guide |
| ------------------- | --------------- | --------------------- |
| [amiberry](https://github.com/midwan/amiberry) | Commodore Amiga | [Wiki](https://github.com/midwan/amiberry/wiki) |

| Libretro-Core | Emulated System | Documentation & Guide |
| ------------- | --------------- | --------------------- |
| [mame2010](https://github.com/libretro/mame2010-libretro) | Multiple Arcade Machine Emulator - Romset 0.139 | [Libretro Docs](https://docs.libretro.com/library/mame_2010/) |
| [mame2016](https://github.com/libretro/mame2016-libretro) | Multiple Arcade Machine Emulator - Romset 0.174 | [Libretro Docs](https://docs.libretro.com/guides/softwarelist-getting-started/) |
| [snes9x2010](https://github.com/libretro/snes9x2010) | Nintendo Super Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/snes9x_2010/) |
| [vice](https://github.com/libretro/vice-libretro) | Commodore C64 | [Libretro Docs](https://docs.libretro.com/library/vice/) |
| [yabause](https://github.com/libretro/yabause) | Sega Saturn | [Libretro Docs](https://docs.libretro.com/library/yabause/) |
---
**Emulators included in RK3399 builds**
| Standalone-Emulator | Emulated System | Documentation & Guide |
| ------------------- | --------------- | --------------------- |
| [amiberry](https://github.com/midwan/amiberry) | Commodore Amiga | [Wiki](https://github.com/midwan/amiberry/wiki) |

| Libretro-Core | Emulated System | Documentation & Guide |
| ------------- | --------------- | --------------------- |
| [mame2010](https://github.com/libretro/mame2010-libretro) | Multiple Arcade Machine Emulator - Romset 0.139 | [Libretro Docs](https://docs.libretro.com/library/mame_2010/) |
| [mame2016](https://github.com/libretro/mame2016-libretro) | Multiple Arcade Machine Emulator - Romset 0.174 | [Libretro Docs](https://docs.libretro.com/guides/softwarelist-getting-started/) |
| [snes9x2010](https://github.com/libretro/snes9x2010) | Nintendo Super Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/snes9x_2010/) |
| [vice](https://github.com/libretro/vice-libretro) | Commodore C64 | [Libretro Docs](https://docs.libretro.com/library/vice/) |
| [yabause](https://github.com/libretro/yabause) | Sega Saturn | [Libretro Docs](https://docs.libretro.com/library/yabause/) |
---
**Emulators included in RPi4 builds**
| Standalone-Emulator | Emulated System | Documentation & Guide |
| ------------------- | --------------- | --------------------- |
| [amiberry](https://github.com/midwan/amiberry) | Commodore Amiga | [Wiki](https://github.com/midwan/amiberry/wiki) |

| Libretro-Core | Emulated System | Documentation & Guide |
| ------------- | --------------- | --------------------- |
| [mame2010](https://github.com/libretro/mame2010-libretro) | Multiple Arcade Machine Emulator - Romset 0.139 | [Libretro Docs](https://docs.libretro.com/library/mame_2010/) |
| [mame2016](https://github.com/libretro/mame2016-libretro) | Multiple Arcade Machine Emulator - Romset 0.174 | [Libretro Docs](https://docs.libretro.com/guides/softwarelist-getting-started/) |
| [snes9x2010](https://github.com/libretro/snes9x2010) | Nintendo Super Nintendo Entertainment System | [Libretro Docs](https://docs.libretro.com/library/snes9x_2010/) |
| [vice](https://github.com/libretro/vice-libretro) | Commodore C64 | [Libretro Docs](https://docs.libretro.com/library/vice/) |
| [yabause](https://github.com/libretro/yabause) | Sega Saturn | [Libretro Docs](https://docs.libretro.com/library/yabause/) |
---
**Builds systems**

You can run a VirtualBox Linux Mint 20.1 Mate VM or a Thinkpad X220 with Linux Mint 20.1 as well as build system. So this distribution should be suitable for you too. For further information see [LibreELEC Wiki / Compile](https://wiki.libreelec.tv/compile).

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

For Generic builds use:
```
PROJECT=Generic ARCH=x86_64 BUILD_PERIODIC=RR BUILDER_NAME=Your_Name make image
```

**Build commands Raspberry**

For Raspberry Pi 4 use:
```
PROJECT=RPi DEVICE=RPi4 ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=Your_Name make image
```

**Build commands Amlogic**

For Amlogic AMLG12B use:
```
PROJECT=Amlogic DEVICE=AMLG12B ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=Your_Name image
```

For universal Amlogic AMLGX images use:
```
PROJECT=Amlogic DEVICE=AMLGX ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=Your_Name make image
```


**Build commands Rockchip**

For RK3399 use:
```
PROJECT=Rockchip DEVICE=RK3399 ARCH=arm BUILD_PERIODIC=RR BUILDER_NAME=Your_Name make image
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
