#pragma bank 6
#include <gb/gb.h>
#include "../tiles/ending.h"
#include "../maps/EndingMap.h"
#include "ending_sequence.h"


void play_ending() BANKED {
    HIDE_SPRITES;
    HIDE_WIN;
    DISPLAY_OFF;
    set_bkg_data(0, 101, EndingTiles);
    set_bkg_tiles(0, 0, 20, 18, Ending1);
    set_slide1_data();
    DISPLAY_ON;
    wait_next();
    DISPLAY_OFF;
    set_bkg_tiles(0, 0, 20, 18, Ending2);
    set_slide2_data();
    DISPLAY_ON;
    wait_next();
    return;
}

void set_slide1_data() {
    uint8_t lvl[2];
    uint8_t stat;
    lvl[0] = level / 10 + 75;
    lvl[1] = level % 10 + 75;
    set_bkg_tiles(13, 9, 2, 1, lvl);
    stat = sword_lvl + 75;
    set_bkg_tiles(4, 13, 1, 1, &stat);
    stat = shield_lvl + 75;
    set_bkg_tiles(4, 15, 1, 1, &stat);
    stat = arrow_lvl + 75;
    set_bkg_tiles(9, 13, 1, 1, &stat);
    stat = quiver_lvl + 75;
    set_bkg_tiles(9, 15, 1, 1, &stat);
    stat = potion_quant_lvl + 75;
    set_bkg_tiles(14, 13, 1, 1, &stat);
    stat = potion_heal_lvl + 75;
    set_bkg_tiles(14, 15, 1, 1, &stat);
}

void set_slide2_data() {
    uint8_t hr[2];
    uint8_t mn[2];
    uint8_t sc[2];
    if (hours < 10) {
        hr[0] = 16;
    }
    else {
        hr[0] = hours / 10 + 75;
    }
    hr[1] = hours % 10 + 75;
    mn[0] = minutes / 10 + 75;
    mn[1] = minutes % 10 + 75;
    sc[0] = seconds / 10 + 75;
    sc[1] = seconds % 10 + 75;
    set_bkg_tiles(10, 14, 2, 1, hr);
    set_bkg_tiles(13, 14, 2, 1, mn);
    set_bkg_tiles(16, 14, 2, 1, sc);
}
