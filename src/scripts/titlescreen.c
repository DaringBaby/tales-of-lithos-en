#pragma bank 3

#include <gb/gb.h>
#include "scripts/titlescreen.h"
#include "tiles/Titlescreen.h"
#include "tiles/TitleText.h"
#include "maps/Title.h"
#include <rand.h>
#include <stdio.h>


uint8_t set_titlescreen() BANKED {
    uint8_t press_start[] = {241, 242, 243, 246, 246, 1, 1, 246, 247, 248, 242, 247};
    uint8_t empty[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
    set_bkg_tiles(4, 16, 12, 1, press_start);
    uint8_t frame = 0;
    SHOW_BKG;
    while (1) {
    seed++;
    wait_vbl_done();
    if (joypad() & J_START) {
        delay(150);
        DISPLAY_OFF;
        delay(150);
        initarand(seed);
        return 0; // continua
    }
    else if (joypad() & J_SELECT) {
        delay(150);
        DISPLAY_OFF;
        delay(150);
        initrand(seed);
        return 1; // nuovo gioco
    }
    if (frame == 0) {
        set_bkg_tiles(4, 16, 12, 1, empty);
    }
    else if (frame == 30) {
        set_bkg_tiles(4, 16, 12, 1, press_start);
    }
    frame++;
    if (frame == 60) {
        frame = 0;
        }
    }

}
