#pragma bank 6
#include "../tiles/IntroSlide1Tiles.h"
#include "../maps/IntroSlide1.h"
#include "../tiles/IntroSlide2Tiles.h"
#include "../maps/IntroSlide2.h"
#include <gb/gb.h>

void start_intro() BANKED {
    set_bkg_data(0, 235, Slide1);
    set_bkg_tiles(0, 0, 20, 18, IntroSlide1);
    SHOW_BKG;
    DISPLAY_ON;
    uint8_t next = 0;
    while (!next) {
        if (joypad() & J_A) {
            next = 1;
        }
    }
    DISPLAY_OFF;
    set_bkg_data(0, 177, Slide2);
    set_bkg_tiles(0, 0, 20, 18, IntroSlide2);
    DISPLAY_ON;
    next = 0;
    while (!next) {
        if (joypad() & J_A) {
            next = 1;
        }
    }
}
