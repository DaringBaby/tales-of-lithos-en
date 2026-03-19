#pragma bank 6
#include "../tiles/IntroSlide1Tiles.h"
#include "../maps/IntroSlide1.h"
#include <gb/gb.h>

void start_intro() BANKED {
    set_bkg_data(0, 235, Slide1);
    set_bkg_tiles(0, 0, 20, 18, IntroSlide1);
    SHOW_BKG;
    DISPLAY_ON;
    while (1) {
        if (joypad() & J_A) {
            return;
        }
    }
}
