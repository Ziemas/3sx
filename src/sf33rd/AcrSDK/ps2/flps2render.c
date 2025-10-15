#include "sf33rd/AcrSDK/ps2/flps2render.h"
#include "common.h"
#include "sf33rd/AcrSDK/ps2/flps2debug.h"
#include "sf33rd/AcrSDK/ps2/flps2etc.h"
#include "sf33rd/AcrSDK/ps2/flps2vram.h"
#include "sf33rd/AcrSDK/ps2/foundaps2.h"

#include "rendering/game_renderer.h"

void flPS2SetClearColor(u32 col);
s32 flPS2SendTextureRegister(u32 th);

s32 flSetRenderState(enum _FLSETRENDERSTATE func, u32 value) {
    u32 th;

    switch (func) {
    case FLRENDER_TEXSTAGE0:
    case FLRENDER_TEXSTAGE1:
    case FLRENDER_TEXSTAGE2:
    case FLRENDER_TEXSTAGE3:
        th = value;

        if (func == FLRENDER_TEXSTAGE0) {
            Renderer_SetTexture(th);
        }

        break;

    case FLRENDER_BACKCOLOR:
        flPS2SetClearColor(value);
        break;

    default:
        break;
    }

    return 1;
}

void flPS2SetClearColor(u32 col) {
    flPs2State.FrameClearColor = col;
}

f32 flPS2ConvScreenFZ(f32 z) {
    z -= 1.0f;
    z = z * -0.5f;
    z *= flPs2State.ZBuffMax;

    return z;
}
