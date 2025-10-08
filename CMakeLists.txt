cmake_minimum_required(VERSION 3.24)
project(3sx LANGUAGES C)

# ======================================
# Options and platform setup
# ======================================

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

find_package(SDL3 3.2.6 REQUIRED)
find_package(FFMPEG COMPONENTS avcodec avformat avutil swresample swscale)

# ======================================
# Source collection
# ======================================

set(GAME_SRC
    src/sf33rd/AcrSDK/common/fbms.c
    src/sf33rd/AcrSDK/common/memfound.c
    src/sf33rd/AcrSDK/common/memmgr.c
    src/sf33rd/AcrSDK/common/mlPAD.c
    src/sf33rd/AcrSDK/common/plapx.c
    src/sf33rd/AcrSDK/common/plbmp.c
    src/sf33rd/AcrSDK/common/plpic.c
    src/sf33rd/AcrSDK/common/pltim2.c
    src/sf33rd/AcrSDK/common/prilay.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/acrmw.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/ADX/flADX.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/CapSndEng/cse.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/CapSndEng/eflSifRpc.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/CapSndEng/eflSpuMap.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/CapSndEng/emlMemMap.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/CapSndEng/emlRefPhd.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/CapSndEng/emlRpcQueue.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/CapSndEng/emlSndDrv.c
    src/sf33rd/AcrSDK/MiddleWare/PS2/CapSndEng/emlTSB.c
    src/sf33rd/AcrSDK/ps2/flPADUSR.c
    src/sf33rd/AcrSDK/ps2/flps2d3d.c
    src/sf33rd/AcrSDK/ps2/flps2debug.c
    src/sf33rd/AcrSDK/ps2/flps2dma.c
    src/sf33rd/AcrSDK/ps2/flps2etc.c
    src/sf33rd/AcrSDK/ps2/flps2math.c
    src/sf33rd/AcrSDK/ps2/flps2ps.c
    src/sf33rd/AcrSDK/ps2/flps2render.c
    src/sf33rd/AcrSDK/ps2/flps2shader.c
    src/sf33rd/AcrSDK/ps2/flps2vram.c
    src/sf33rd/AcrSDK/ps2/foundaps2.c
    src/sf33rd/AcrSDK/ps2/ps2PAD.c
    src/sf33rd/Source/Common/FileSizeAFS.c
    src/sf33rd/Source/Common/MemMan.c
    src/sf33rd/Source/Common/PPGFile.c
    src/sf33rd/Source/Common/PPGWork.c
    src/sf33rd/Source/Compress/Lz77/Lz77Dec.c
    src/sf33rd/Source/Compress/zlibApp.c
    src/sf33rd/Source/Game/aboutspr.c
    src/sf33rd/Source/Game/ac0000.c
    src/sf33rd/Source/Game/ac0001.c
    src/sf33rd/Source/Game/ac0002.c
    src/sf33rd/Source/Game/ac0003.c
    src/sf33rd/Source/Game/ac0004.c
    src/sf33rd/Source/Game/AcrUtil.c
    src/sf33rd/Source/Game/ACTIVE00.c
    src/sf33rd/Source/Game/active01.c
    src/sf33rd/Source/Game/active02.c
    src/sf33rd/Source/Game/active03.c
    src/sf33rd/Source/Game/active04.c
    src/sf33rd/Source/Game/active05.c
    src/sf33rd/Source/Game/active06.c
    src/sf33rd/Source/Game/active07.c
    src/sf33rd/Source/Game/active08.c
    src/sf33rd/Source/Game/active09.c
    src/sf33rd/Source/Game/active10.c
    src/sf33rd/Source/Game/active11.c
    src/sf33rd/Source/Game/active12.c
    src/sf33rd/Source/Game/active13.c
    src/sf33rd/Source/Game/active14.c
    src/sf33rd/Source/Game/active15.c
    src/sf33rd/Source/Game/active16.c
    src/sf33rd/Source/Game/active17.c
    src/sf33rd/Source/Game/active18.c
    src/sf33rd/Source/Game/active19.c
    src/sf33rd/Source/Game/app_data.c
    src/sf33rd/Source/Game/appear.c
    src/sf33rd/Source/Game/BBBSCOM2.c
    src/sf33rd/Source/Game/BBBSCOM.c
    src/sf33rd/Source/Game/BCD.c
    src/sf33rd/Source/Game/bg000.c
    src/sf33rd/Source/Game/bg010.c
    src/sf33rd/Source/Game/bg020.c
    src/sf33rd/Source/Game/bg030.c
    src/sf33rd/Source/Game/bg040.c
    src/sf33rd/Source/Game/bg050.c
    src/sf33rd/Source/Game/bg060.c
    src/sf33rd/Source/Game/bg070.c
    src/sf33rd/Source/Game/bg080.c
    src/sf33rd/Source/Game/bg090.c
    src/sf33rd/Source/Game/bg100.c
    src/sf33rd/Source/Game/bg120.c
    src/sf33rd/Source/Game/bg130.c
    src/sf33rd/Source/Game/bg140.c
    src/sf33rd/Source/Game/bg150.c
    src/sf33rd/Source/Game/bg160.c
    src/sf33rd/Source/Game/bg180.c
    src/sf33rd/Source/Game/bg190.c
    src/sf33rd/Source/Game/bg.c
    src/sf33rd/Source/Game/bg_data.c
    src/sf33rd/Source/Game/bg_sub.c
    src/sf33rd/Source/Game/bns_bg2.c
    src/sf33rd/Source/Game/bonus_bg.c
    src/sf33rd/Source/Game/CALDIR.c
    src/sf33rd/Source/Game/CHARID.c
    src/sf33rd/Source/Game/CHARSET.c
    src/sf33rd/Source/Game/chren3rd.c
    src/sf33rd/Source/Game/Ck_Pass.c
    src/sf33rd/Source/Game/cmb_win.c
    src/sf33rd/Source/Game/cmd_data.c
    src/sf33rd/Source/Game/CMD_MAIN.c
    src/sf33rd/Source/Game/color3rd.c
    src/sf33rd/Source/Game/Com_Data.c
    src/sf33rd/Source/Game/COM_DATU.c
    src/sf33rd/Source/Game/Com_Pl.c
    src/sf33rd/Source/Game/Com_Sub.c
    src/sf33rd/Source/Game/Continue.c
    src/sf33rd/Source/Game/count.c
    src/sf33rd/Source/Game/DC_Ghost.c
    src/sf33rd/Source/Game/debug/Deb_Data.c
    src/sf33rd/Source/Game/debug/Debug.c
    src/sf33rd/Source/Game/debug/Debug_ID.c
    src/sf33rd/Source/Game/debug/Nakai.c
    src/sf33rd/Source/Game/debug/OBJTEST.c
    src/sf33rd/Source/Game/debug/OTESTDAT.c
    src/sf33rd/Source/Game/DEMO00.c
    src/sf33rd/Source/Game/DEMO01.c
    src/sf33rd/Source/Game/DEMO02.c
    src/sf33rd/Source/Game/Demo_Dat.c
    src/sf33rd/Source/Game/DIR_DATA.c
    src/sf33rd/Source/Game/EFF00.c
    src/sf33rd/Source/Game/EFF01.c
    src/sf33rd/Source/Game/EFF02.c
    src/sf33rd/Source/Game/EFF03.c
    src/sf33rd/Source/Game/EFF04.c
    src/sf33rd/Source/Game/eff05.c
    src/sf33rd/Source/Game/eff06.c
    src/sf33rd/Source/Game/EFF07.c
    src/sf33rd/Source/Game/eff08.c
    src/sf33rd/Source/Game/EFF09.c
    src/sf33rd/Source/Game/EFF10.c
    src/sf33rd/Source/Game/EFF11.c
    src/sf33rd/Source/Game/eff12.c
    src/sf33rd/Source/Game/EFF13.c
    src/sf33rd/Source/Game/eff14.c
    src/sf33rd/Source/Game/EFF15.c
    src/sf33rd/Source/Game/EFF16.c
    src/sf33rd/Source/Game/EFF17.c
    src/sf33rd/Source/Game/EFF18.c
    src/sf33rd/Source/Game/EFF19.c
    src/sf33rd/Source/Game/eff20.c
    src/sf33rd/Source/Game/EFF21.c
    src/sf33rd/Source/Game/EFF22.c
    src/sf33rd/Source/Game/EFF23.c
    src/sf33rd/Source/Game/EFF24.c
    src/sf33rd/Source/Game/EFF25.c
    src/sf33rd/Source/Game/EFF26.c
    src/sf33rd/Source/Game/EFF27.c
    src/sf33rd/Source/Game/EFF28.c
    src/sf33rd/Source/Game/EFF29.c
    src/sf33rd/Source/Game/EFF30.c
    src/sf33rd/Source/Game/EFF31.c
    src/sf33rd/Source/Game/EFF32.c
    src/sf33rd/Source/Game/EFF33.c
    src/sf33rd/Source/Game/EFF34.c
    src/sf33rd/Source/Game/eff35.c
    src/sf33rd/Source/Game/eff36.c
    src/sf33rd/Source/Game/EFF37.c
    src/sf33rd/Source/Game/EFF38.c
    src/sf33rd/Source/Game/Eff39.c
    src/sf33rd/Source/Game/EFF40.c
    src/sf33rd/Source/Game/EFF41.c
    src/sf33rd/Source/Game/EFF42.c
    src/sf33rd/Source/Game/Eff43.c
    src/sf33rd/Source/Game/EFF44.c
    src/sf33rd/Source/Game/EFF45.c
    src/sf33rd/Source/Game/EFF46.c
    src/sf33rd/Source/Game/EFF47.c
    src/sf33rd/Source/Game/EFF48.c
    src/sf33rd/Source/Game/EFF49.c
    src/sf33rd/Source/Game/Eff50.c
    src/sf33rd/Source/Game/Eff51.c
    src/sf33rd/Source/Game/Eff52.c
    src/sf33rd/Source/Game/EFF53.c
    src/sf33rd/Source/Game/EFF54.c
    src/sf33rd/Source/Game/EFF55.c
    src/sf33rd/Source/Game/EFF56.c
    src/sf33rd/Source/Game/EFF57.c
    src/sf33rd/Source/Game/EFF58.c
    src/sf33rd/Source/Game/Eff59.c
    src/sf33rd/Source/Game/EFF60.c
    src/sf33rd/Source/Game/EFF61.c
    src/sf33rd/Source/Game/EFF62.c
    src/sf33rd/Source/Game/EFF63.c
    src/sf33rd/Source/Game/EFF64.c
    src/sf33rd/Source/Game/EFF65.c
    src/sf33rd/Source/Game/EFF66.c
    src/sf33rd/Source/Game/EFF67.c
    src/sf33rd/Source/Game/EFF68.c
    src/sf33rd/Source/Game/EFF69.c
    src/sf33rd/Source/Game/EFF70.c
    src/sf33rd/Source/Game/EFF71.c
    src/sf33rd/Source/Game/EFF72.c
    src/sf33rd/Source/Game/eff73.c
    src/sf33rd/Source/Game/EFF74.c
    src/sf33rd/Source/Game/EFF75.c
    src/sf33rd/Source/Game/Eff76.c
    src/sf33rd/Source/Game/EFF77.c
    src/sf33rd/Source/Game/EFF78.c
    src/sf33rd/Source/Game/Eff79.c
    src/sf33rd/Source/Game/Eff80.c
    src/sf33rd/Source/Game/Eff81.c
    src/sf33rd/Source/Game/EFF82.c
    src/sf33rd/Source/Game/EFF83.c
    src/sf33rd/Source/Game/EFF84.c
    src/sf33rd/Source/Game/EFF85.c
    src/sf33rd/Source/Game/EFF86.c
    src/sf33rd/Source/Game/EFF87.c
    src/sf33rd/Source/Game/EFF90.c
    src/sf33rd/Source/Game/eff91.c
    src/sf33rd/Source/Game/EFF92.c
    src/sf33rd/Source/Game/Eff93.c
    src/sf33rd/Source/Game/eff94.c
    src/sf33rd/Source/Game/Eff95.c
    src/sf33rd/Source/Game/EFF96.c
    src/sf33rd/Source/Game/eff97.c
    src/sf33rd/Source/Game/EFF98.c
    src/sf33rd/Source/Game/Eff99.c
    src/sf33rd/Source/Game/EFFA0.c
    src/sf33rd/Source/Game/EFFA1.c
    src/sf33rd/Source/Game/EffA2.c
    src/sf33rd/Source/Game/EFFA3.c
    src/sf33rd/Source/Game/EFFA5.c
    src/sf33rd/Source/Game/EFFA6.c
    src/sf33rd/Source/Game/EFFA7.c
    src/sf33rd/Source/Game/EFFA8.c
    src/sf33rd/Source/Game/EffA9.c
    src/sf33rd/Source/Game/EFFB0.c
    src/sf33rd/Source/Game/EFFB1.c
    src/sf33rd/Source/Game/effb2.c
    src/sf33rd/Source/Game/effb3.c
    src/sf33rd/Source/Game/EFFB4.c
    src/sf33rd/Source/Game/EFFB5.c
    src/sf33rd/Source/Game/EFFB6.c
    src/sf33rd/Source/Game/EFFB7.c
    src/sf33rd/Source/Game/EFFB8.c
    src/sf33rd/Source/Game/effb9.c
    src/sf33rd/Source/Game/EFFC0.c
    src/sf33rd/Source/Game/EFFC1.c
    src/sf33rd/Source/Game/EFFC2.c
    src/sf33rd/Source/Game/EFFC3.c
    src/sf33rd/Source/Game/EFFC4.c
    src/sf33rd/Source/Game/EFFC5.c
    src/sf33rd/Source/Game/EFFC6.c
    src/sf33rd/Source/Game/EFFC7.c
    src/sf33rd/Source/Game/EFFC8.c
    src/sf33rd/Source/Game/EFFC9.c
    src/sf33rd/Source/Game/EFFD0.c
    src/sf33rd/Source/Game/EFFD1.c
    src/sf33rd/Source/Game/effd3.c
    src/sf33rd/Source/Game/EFFD4.c
    src/sf33rd/Source/Game/EFFD5.c
    src/sf33rd/Source/Game/EFFD6.c
    src/sf33rd/Source/Game/EFFD7.c
    src/sf33rd/Source/Game/EffD8.c
    src/sf33rd/Source/Game/EFFD9.c
    src/sf33rd/Source/Game/EffE0.c
    src/sf33rd/Source/Game/EFFE1.c
    src/sf33rd/Source/Game/EFFE2.c
    src/sf33rd/Source/Game/effe3.c
    src/sf33rd/Source/Game/EFFE4.c
    src/sf33rd/Source/Game/EFFE5.c
    src/sf33rd/Source/Game/effe6.c
    src/sf33rd/Source/Game/EFFE7.c
    src/sf33rd/Source/Game/EFFE8.c
    src/sf33rd/Source/Game/effe9.c
    src/sf33rd/Source/Game/EFFECT.c
    src/sf33rd/Source/Game/efff0.c
    src/sf33rd/Source/Game/EFFF2.c
    src/sf33rd/Source/Game/EFFF4.c
    src/sf33rd/Source/Game/efff5.c
    src/sf33rd/Source/Game/efff6.c
    src/sf33rd/Source/Game/EFFF8.c
    src/sf33rd/Source/Game/EFFF9.c
    src/sf33rd/Source/Game/EffG0.c
    src/sf33rd/Source/Game/EFFG3.c
    src/sf33rd/Source/Game/EFFG4.c
    src/sf33rd/Source/Game/EFFG5.c
    src/sf33rd/Source/Game/EFFG6.c
    src/sf33rd/Source/Game/EFFG7.c
    src/sf33rd/Source/Game/effg8.c
    src/sf33rd/Source/Game/EFFG9.c
    src/sf33rd/Source/Game/EFFH0.c
    src/sf33rd/Source/Game/EFFH1.c
    src/sf33rd/Source/Game/EFFH2.c
    src/sf33rd/Source/Game/EFFH6.c
    src/sf33rd/Source/Game/EFFH9.c
    src/sf33rd/Source/Game/EFFI0.c
    src/sf33rd/Source/Game/EFFI3.c
    src/sf33rd/Source/Game/EFFI4.c
    src/sf33rd/Source/Game/effi6.c
    src/sf33rd/Source/Game/EFFI7.c
    src/sf33rd/Source/Game/EFFI8.c
    src/sf33rd/Source/Game/EFFI9.c
    src/sf33rd/Source/Game/EFFJ0.c
    src/sf33rd/Source/Game/EFFJ2.c
    src/sf33rd/Source/Game/EFFJ4.c
    src/sf33rd/Source/Game/effJ6.c
    src/sf33rd/Source/Game/EFFJ7.c
    src/sf33rd/Source/Game/EFFJ8.c
    src/sf33rd/Source/Game/EFFJ9.c
    src/sf33rd/Source/Game/EFFK2.c
    src/sf33rd/Source/Game/EFFK3.c
    src/sf33rd/Source/Game/EFFK4.c
    src/sf33rd/Source/Game/EFFK5.c
    src/sf33rd/Source/Game/EffK6.c
    src/sf33rd/Source/Game/EFFK7.c
    src/sf33rd/Source/Game/EFFK8.c
    src/sf33rd/Source/Game/EFFK9.c
    src/sf33rd/Source/Game/EFFL0.c
    src/sf33rd/Source/Game/EFFL1.c
    src/sf33rd/Source/Game/effL2.c
    src/sf33rd/Source/Game/effL3.c
    src/sf33rd/Source/Game/effL4.c
    src/sf33rd/Source/Game/effL5.c
    src/sf33rd/Source/Game/effl6.c
    src/sf33rd/Source/Game/effL7.c
    src/sf33rd/Source/Game/effl8.c
    src/sf33rd/Source/Game/effL9.c
    src/sf33rd/Source/Game/effM0.c
    src/sf33rd/Source/Game/EFFM1.c
    src/sf33rd/Source/Game/EFFM2.c
    src/sf33rd/Source/Game/EffM3.c
    src/sf33rd/Source/Game/effM5.c
    src/sf33rd/Source/Game/effM6.c
    src/sf33rd/Source/Game/effM7.c
    src/sf33rd/Source/Game/effM8.c
    src/sf33rd/Source/Game/EFFXX.c
    src/sf33rd/Source/Game/end_0.c
    src/sf33rd/Source/Game/end_10.c
    src/sf33rd/Source/Game/end_11.c
    src/sf33rd/Source/Game/end_12.c
    src/sf33rd/Source/Game/end_13.c
    src/sf33rd/Source/Game/end_14.c
    src/sf33rd/Source/Game/end_16.c
    src/sf33rd/Source/Game/end_17.c
    src/sf33rd/Source/Game/end_18.c
    src/sf33rd/Source/Game/end_19.c
    src/sf33rd/Source/Game/end_1.c
    src/sf33rd/Source/Game/end_20.c
    src/sf33rd/Source/Game/end_2.c
    src/sf33rd/Source/Game/end_3.c
    src/sf33rd/Source/Game/end_4.c
    src/sf33rd/Source/Game/end_5.c
    src/sf33rd/Source/Game/end_6.c
    src/sf33rd/Source/Game/end_7.c
    src/sf33rd/Source/Game/end_8.c
    src/sf33rd/Source/Game/end_9.c
    src/sf33rd/Source/Game/end_data.c
    src/sf33rd/Source/Game/end_main.c
    src/sf33rd/Source/Game/Entry.c
    src/sf33rd/Source/Game/EX_DATA.c
    src/sf33rd/Source/Game/Flash_LP.c
    src/sf33rd/Source/Game/fl_com00.c
    src/sf33rd/Source/Game/FL_COM02.c
    src/sf33rd/Source/Game/FOLLOW02.c
    src/sf33rd/Source/Game/Game.c
    src/sf33rd/Source/Game/GameOver.c
    src/sf33rd/Source/Game/GD3rd.c
    src/sf33rd/Source/Game/Getup.c
    src/sf33rd/Source/Game/Grade.c
    src/sf33rd/Source/Game/HITCHECK.c
    src/sf33rd/Source/Game/HITEFEF.c
    src/sf33rd/Source/Game/HITEFPL.c
    src/sf33rd/Source/Game/HITPLEF.c
    src/sf33rd/Source/Game/HITPLPL.c
    src/sf33rd/Source/Game/init3rd.c
    src/sf33rd/Source/Game/IOConv.c
    src/sf33rd/Source/Game/LOSE_PL.c
    src/sf33rd/Source/Game/main.c
    src/sf33rd/Source/Game/Manage.c
    src/sf33rd/Source/Game/menu.c
    src/sf33rd/Source/Game/Message3rd/C_USA/msgExtra_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/msgMenu_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/msgSysDir_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/msgTable_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL00End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL00Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL00Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL01End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL01Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL01Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL02End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL02Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL02Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL03End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL03Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL03Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL04End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL04Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL04Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL05End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL05Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL05Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL06End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL06Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL06Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL07End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL07Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL07Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL08End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL08Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL08Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL09End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL09Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL09Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL10End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL10Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL10Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL11End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL11Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL11Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL12End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL12Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL12Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL13End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL13Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL13Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL14End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL14Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL15End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL15Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL15Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL16End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL16Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL16Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL17End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL17Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL18End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL18Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL18Win_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL19End_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL19Tlk_usa.c
    src/sf33rd/Source/Game/Message3rd/C_USA/PL19Win_usa.c
    src/sf33rd/Source/Game/meta_col.c
    src/sf33rd/Source/Game/MMTMCNT.c
    src/sf33rd/Source/Game/MTRANS.c
    src/sf33rd/Source/Game/Next_CPU.c
    src/sf33rd/Source/Game/n_input.c
    src/sf33rd/Source/Game/OPENING.c
    src/sf33rd/Source/Game/op_sub.c
    src/sf33rd/Source/Game/pass0000.c
    src/sf33rd/Source/Game/pass0001.c
    src/sf33rd/Source/Game/pass0002.c
    src/sf33rd/Source/Game/pass0003.c
    src/sf33rd/Source/Game/pass00.c
    src/sf33rd/Source/Game/PASS01.c
    src/sf33rd/Source/Game/PASS02.c
    src/sf33rd/Source/Game/PASS03.c
    src/sf33rd/Source/Game/PASS04.c
    src/sf33rd/Source/Game/PASS05.c
    src/sf33rd/Source/Game/PASS06.c
    src/sf33rd/Source/Game/PASS07.c
    src/sf33rd/Source/Game/PASS08.c
    src/sf33rd/Source/Game/PASS09.c
    src/sf33rd/Source/Game/pass10.c
    src/sf33rd/Source/Game/PASS11.c
    src/sf33rd/Source/Game/PASS12.c
    src/sf33rd/Source/Game/pass13.c
    src/sf33rd/Source/Game/pass14.c
    src/sf33rd/Source/Game/pass15.c
    src/sf33rd/Source/Game/pass16.c
    src/sf33rd/Source/Game/pass17.c
    src/sf33rd/Source/Game/pass18.c
    src/sf33rd/Source/Game/pass19.c
    src/sf33rd/Source/Game/Pause.c
    src/sf33rd/Source/Game/PLCNT2.c
    src/sf33rd/Source/Game/PLCNT3.c
    src/sf33rd/Source/Game/PLCNT.c
    src/sf33rd/Source/Game/PLMAIN2.c
    src/sf33rd/Source/Game/PLMAIN.c
    src/sf33rd/Source/Game/PLPAT00.c
    src/sf33rd/Source/Game/PLPAT01.c
    src/sf33rd/Source/Game/PLPAT02.c
    src/sf33rd/Source/Game/PLPAT03.c
    src/sf33rd/Source/Game/PLPAT04.c
    src/sf33rd/Source/Game/PLPAT05.c
    src/sf33rd/Source/Game/PLPAT06.c
    src/sf33rd/Source/Game/PLPAT07.c
    src/sf33rd/Source/Game/PLPAT08.c
    src/sf33rd/Source/Game/PLPAT09.c
    src/sf33rd/Source/Game/plpat10.c
    src/sf33rd/Source/Game/PLPAT11.c
    src/sf33rd/Source/Game/PLPAT12.c
    src/sf33rd/Source/Game/PLPAT13.c
    src/sf33rd/Source/Game/plpat14.c
    src/sf33rd/Source/Game/plpat16.c
    src/sf33rd/Source/Game/plpat17.c
    src/sf33rd/Source/Game/plpat18.c
    src/sf33rd/Source/Game/plpat19.c
    src/sf33rd/Source/Game/plpat20.c
    src/sf33rd/Source/Game/PLPAT.c
    src/sf33rd/Source/Game/PLPATUNI.c
    src/sf33rd/Source/Game/PLPCA.c
    src/sf33rd/Source/Game/PLPCU.c
    src/sf33rd/Source/Game/PLPDM.c
    src/sf33rd/Source/Game/PLPNM.c
    src/sf33rd/Source/Game/PLS00.c
    src/sf33rd/Source/Game/PLS01.c
    src/sf33rd/Source/Game/PLS02.c
    src/sf33rd/Source/Game/PLS03.c
    src/sf33rd/Source/Game/POW_DATA.c
    src/sf33rd/Source/Game/Pow_Pow.c
    src/sf33rd/Source/Game/PulPul.c
    src/sf33rd/Source/Game/RAMCNT.c
    src/sf33rd/Source/Game/RANKING.c
    src/sf33rd/Source/Game/Reset.c
    src/sf33rd/Source/Game/Saver.c
    src/sf33rd/Source/Game/sc_data.c
    src/sf33rd/Source/Game/sc_sub.c
    src/sf33rd/Source/Game/SE.c
    src/sf33rd/Source/Game/Se_Data.c
    src/sf33rd/Source/Game/Sel_Data.c
    src/sf33rd/Source/Game/sel_pl.c
    src/sf33rd/Source/Game/SHELL00.c
    src/sf33rd/Source/Game/SHELL01.c
    src/sf33rd/Source/Game/SHELL03.c
    src/sf33rd/Source/Game/SHELL04.c
    src/sf33rd/Source/Game/SHELL05.c
    src/sf33rd/Source/Game/SHELL07.c
    src/sf33rd/Source/Game/SHELL11.c
    src/sf33rd/Source/Game/SHELL12.c
    src/sf33rd/Source/Game/SHELL13.c
    src/sf33rd/Source/Game/SHELL14.c
    src/sf33rd/Source/Game/SLOWF.c
    src/sf33rd/Source/Game/Sound3rd.c
    src/sf33rd/Source/Game/spgauge.c
    src/sf33rd/Source/Game/staff.c
    src/sf33rd/Source/Game/stun.c
    src/sf33rd/Source/Game/SysDir.c
    src/sf33rd/Source/Game/SYS_sub2.c
    src/sf33rd/Source/Game/SYS_sub.c
    src/sf33rd/Source/Game/ta_sub.c
    src/sf33rd/Source/Game/TATE00.c
    src/sf33rd/Source/Game/texcash.c
    src/sf33rd/Source/Game/texgroup.c
    src/sf33rd/Source/Game/VITAL.c
    src/sf33rd/Source/Game/vm.c
    src/sf33rd/Source/Game/VM_DATA.c
    src/sf33rd/Source/Game/VM_SUB.c
    src/sf33rd/Source/Game/vs_shell.c
    src/sf33rd/Source/Game/Win.c
    src/sf33rd/Source/Game/win_pl.c
    src/sf33rd/Source/Game/WORK_SYS.c
    src/sf33rd/Source/Game/workuser.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL00.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL01.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL02.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL03.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL04.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL05.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL06.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL07.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL08.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL09.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL10.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL11.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL12.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL13.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL14.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL15.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL16.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL17.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL18.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_PL19.c
    src/sf33rd/Source/PS2/cseDataFiles/PHD_SE.c
    src/sf33rd/Source/PS2/cseDataFiles/SpuMap.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL00.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL01.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL02.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL03.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL04.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL05.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL06.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL07.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL08.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL09.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL10.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL11.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL12.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL13.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL14.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL15.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL16.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL17.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL18.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_PL19.c
    src/sf33rd/Source/PS2/cseDataFiles/TSB_SE.c
    src/sf33rd/Source/PS2/mc/knjsub.c
    src/sf33rd/Source/PS2/mc/mcsub.c
    src/sf33rd/Source/PS2/mc/msgsub.c
    src/sf33rd/Source/PS2/mc/msgtble.c
    src/sf33rd/Source/PS2/mc/msgtblj.c
    src/sf33rd/Source/PS2/mc/savesub.c
    src/sf33rd/Source/PS2/ps2Quad.c
)

set(CRI_SRC
    src/cri/libadxe/adx_amp.c
    src/cri/libadxe/adx_bahx.c
    src/cri/libadxe/adx_baif.c
    src/cri/libadxe/adx_bau.c
    src/cri/libadxe/adx_bsc.c
    src/cri/libadxe/adx_bsps.c
    src/cri/libadxe/adx_bwav.c
    src/cri/libadxe/adx_crs.c
    src/cri/libadxe/adx_dcd3.c
    src/cri/libadxe/adx_dcd5.c
    src/cri/libadxe/adx_dcd.c
    src/cri/libadxe/adx_errs.c
    src/cri/libadxe/adx_fcch.c
    src/cri/libadxe/adx_fini.c
    src/cri/libadxe/adx_fs.c
    src/cri/libadxe/adx_fsvr.c
    src/cri/libadxe/adx_inis.c
    src/cri/libadxe/adx_lsc.c
    src/cri/libadxe/adx_mps2.c
    src/cri/libadxe/adx_rnap.c
    src/cri/libadxe/adx_sjd.c
    src/cri/libadxe/adx_stmc.c
    src/cri/libadxe/adx_sudv.c
    src/cri/libadxe/adx_suht.c
    src/cri/libadxe/adx_tlk2.c
    src/cri/libadxe/adx_tlk.c
    src/cri/libadxe/adx_tsvr.c
    src/cri/libadxe/adx_xpnd.c
    src/cri/libadxe/cri_cvfs.c
    src/cri/libadxe/cri_srd.c
    src/cri/libadxe/dtr.c
    src/cri/libadxe/dtx.c
    src/cri/libadxe/dvci.c
    src/cri/libadxe/dvci_sub.c
    src/cri/libadxe/htci.c
    src/cri/libadxe/htci_sub.c
    src/cri/libadxe/lsc.c
    src/cri/libadxe/lsc_crs.c
    src/cri/libadxe/lsc_err.c
    src/cri/libadxe/lsc_ini.c
    src/cri/libadxe/lsc_svr.c
    src/cri/libadxe/ps2_rna.c
    src/cri/libadxe/rna_crs.c
    src/cri/libadxe/sj_crs.c
    src/cri/libadxe/sj_err.c
    src/cri/libadxe/sj_mem.c
    src/cri/libadxe/sj_rbf.c
    src/cri/libadxe/sjr_clt.c
    src/cri/libadxe/sj_uni.c
    src/cri/libadxe/sj_utl.c
    src/cri/libadxe/sjx.c
    src/cri/libadxe/svm.c
)

set(BIN2OBJ_SRC
    src/bin2obj/asstbl.c
    src/bin2obj/buttobi.c
    src/bin2obj/char_table.c
    src/bin2obj/etc.c
    src/bin2obj/exchange.c
    src/bin2obj/gauge.c
)

set(PORT_SRC
    src/port/float_clamp.c
    src/port/flps2asm_stubs.c
    src/port/sdk/sdk_libmc.c
    src/port/sdk/sdk_libpad2.c
    src/port/sdk/sdk_stubs.c
    src/port/sdk/sdk_threads.c
    src/port/sdl/sdl_adx_sound.c
    src/port/sdl/sdl_app.c
    src/port/sdl/sdl_game_renderer.c
    src/port/sdl/sdl_message_renderer.c
    src/port/sdl/sdl_pad.c
    src/port/sound/emlShim.c
    src/port/sound/spu.c
    src/port/utils.c
)

set(ZLIB_SRC
    zlib/adler32.c
    zlib/compress.c
    zlib/crc32.c
    zlib/deflate.c
    zlib/infblock.c
    zlib/infcodes.c
    zlib/inffast.c
    zlib/inflate.c
    zlib/inftrees.c
    zlib/infutil.c
    zlib/trees.c
    zlib/uncompr.c
    zlib/zutil.c
)

add_subdirectory(libco)

add_executable(3sx MACOSX_BUNDLE
    ${GAME_SRC} ${CRI_SRC} ${BIN2OBJ_SRC} ${PORT_SRC} ${ZLIB_SRC}
)

# ======================================
# Include directories
# ======================================

target_include_directories(3sx PRIVATE
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_SOURCE_DIR}/include/sdk
    ${PROJECT_SOURCE_DIR}/include/cri
    ${PROJECT_SOURCE_DIR}/include/cri/ee
    ${PROJECT_SOURCE_DIR}/zlib
    ${PROJECT_SOURCE_DIR}/libco
)

# ======================================
# Compiler and linker flags
# ======================================

target_compile_definitions(3sx PRIVATE
    $<$<CONFIG:Debug>:DEBUG>
    $<$<CONFIG:Release>:RELEASE>
    TARGET_SDL3
    SOUND_DISABLED
    XPT_TGT_EE
    _POSIX_C_SOURCE
)

target_compile_options(3sx PRIVATE
    -Wall
    -Werror
    -Wpointer-to-int-cast
    -Wno-macro-redefined
    -Wno-deprecated-non-prototype
    -Wno-missing-braces
    -Wno-self-assign
    -Wno-format
    -Wno-tautological-constant-out-of-range-compare
    -Wno-tautological-overlap-compare
    -Wno-gcc-compat
    -Wno-unknown-pragmas
    -Wno-c2x-extensions
    -Wno-unused-value
    -Wno-unused-variable
    -Wno-unused-but-set-variable
    -Wno-unused-comparison
    -Wno-unused-function
    -Wno-int-to-pointer-cast
    -Wno-int-conversion
    -Wno-incompatible-pointer-types
    -Wno-incompatible-function-pointer-types
    -Wno-pointer-sign
    -Wno-shift-count-overflow
)

target_link_libraries(3sx PRIVATE
    libco
    m
)

set_target_properties(3sx PROPERTIES
    MACOSX_BUNDLE_INFO_PLIST "${CMAKE_SOURCE_DIR}/cmake/Info.plist"
)

if(APPLE)
    set_target_properties(3sx PROPERTIES
        INSTALL_RPATH "@executable_path/../Frameworks"
    )
elseif(UNIX AND NOT APPLE)
    set_target_properties(3sx PROPERTIES
        INSTALL_RPATH "\$ORIGIN/../lib"
    )
endif()

# ======================================
# Dependencies
# ======================================

set(THIRD_PARTY_DIR "${CMAKE_SOURCE_DIR}/third_party")
set(FFMPEG_ROOT "${THIRD_PARTY_DIR}/ffmpeg/build")
set(SDL3_ROOT "${THIRD_PARTY_DIR}/sdl3/build")

target_link_libraries(3sx PRIVATE
    SDL3::SDL3
    FFMPEG::avcodec
    FFMPEG::avformat
    FFMPEG::avutil
    FFMPEG::swscale
    FFMPEG::swresample
)

# ======================================
# Installation
# ======================================

if(APPLE)
    install(TARGETS 3sx
        RUNTIME DESTINATION bin
        BUNDLE DESTINATION .
    )

    file(GLOB FFMPEG_DYLIBS "${FFMPEG_ROOT}/lib/*.dylib")

    install(FILES
        ${FFMPEG_DYLIBS}
        ${SDL3_ROOT}/lib/libSDL3.0.dylib
        DESTINATION 3SX.app/Contents/Frameworks
    )
elseif(WIN32)
    install(TARGETS 3sx
        RUNTIME DESTINATION bin
    )

    file(GLOB FFMPEG_DLLS "${FFMPEG_ROOT}/bin/*.dll")

    install(FILES
        ${FFMPEG_DLLS}
        ${SDL3_ROOT}/bin/SDL3.dll
        DESTINATION bin
    )
elseif(UNIX)
    install(TARGETS 3sx
        RUNTIME DESTINATION bin
    )

    file(GLOB FFMPEG_SO "${FFMPEG_ROOT}/lib/*.so*")

    install(FILES
        ${FFMPEG_SO}
        ${SDL3_ROOT}/lib/libSDL3.so
        DESTINATION lib
    )
endif()

# ======================================
# Packaging
# ======================================

set(CPACK_PACKAGE_NAME "3SX")
set(CPACK_PACKAGE_VENDOR "CrowdedStreet")
# set(CPACK_PACKAGE_VERSION "1.0.0")

if(WIN32)
    set(CPACK_GENERATOR "ZIP")
elseif(APPLE)
    set(CPACK_GENERATOR "DragNDrop")
else(UNIX)
    set(CPACK_GENERATOR "TGZ")
endif()

include(CPack)
