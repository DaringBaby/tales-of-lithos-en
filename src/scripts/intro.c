#pragma bank 6
#include "../tiles/IntroSlide1Tiles.h"
#include "../maps/IntroSlide1.h"
#include "../tiles/IntroSlide2Tiles.h"
#include "../maps/IntroSlide2.h"
#include "../tiles/IntroSlide3Tiles.h"
#include "../maps/IntroSlide3.h"
#include "../maps/IntroText.h"
#include <gb/gb.h>

void start_intro() BANKED {
    set_bkg_data(0, 236, Slide1);
    set_bkg_tiles(0, 0, 20, 18, IntroSlide1);
    set_bkg_tiles(1, 14, 18, 1, line1);
    set_bkg_tiles(1, 16, 18, 1, line2);
    SHOW_BKG;
    DISPLAY_ON;
    wait_next();
    set_bkg_tiles(1, 14, 18, 1, line3);
    set_bkg_tiles(1, 16, 18, 1, line4);
    wait_next();
    DISPLAY_OFF;
    set_bkg_data(0, 242, Slide3);
    set_bkg_tiles(0, 0, 20, 18, IntroSlide3);
    set_bkg_tiles(1, 14, 18, 1, line5);
    set_bkg_tiles(1, 16, 18, 1, line6);
    DISPLAY_ON;
    wait_next();
    set_bkg_tiles(1, 14, 18, 1, line7);
    set_bkg_tiles(1, 16, 18, 1, line8);
    wait_next();
    set_bkg_tiles(1, 14, 18, 1, line9);
    set_bkg_tiles(1, 16, 18, 1, line10);
    wait_next();
    set_bkg_tiles(1, 14, 18, 1, line11);
    set_bkg_tiles(1, 16, 18, 1, line_empty);
    wait_next();
    DISPLAY_OFF;
    set_bkg_data(0, 180, Slide2);
    set_bkg_tiles(0, 0, 20, 18, IntroSlide2);
    set_bkg_tiles(1, 14, 18, 1, line12);
    set_bkg_tiles(1, 16, 18, 1, line13);
    DISPLAY_ON;
    wait_next();
    set_bkg_tiles(1, 14, 18, 1, line14);
    set_bkg_tiles(1, 16, 18, 1, line15);
    wait_next();
    set_bkg_tiles(1, 14, 18, 1, line16);
    set_bkg_tiles(1, 16, 18, 1, line17);
    wait_next();
    set_bkg_tiles(1, 14, 18, 1, line18);
    set_bkg_tiles(1, 16, 18, 1, line19);
    wait_next();
    set_bkg_tiles(1, 14, 18, 1, line20);
    set_bkg_tiles(1, 16, 18, 1, line21);
    wait_next();
    set_bkg_tiles(1, 14, 18, 1, line22);
    set_bkg_tiles(1, 16, 18, 1, line23);
    uint8_t next = 0;
    while (!next) {
        if (joypad() & J_A) {
            next = 1;
            delay(50);
            DISPLAY_OFF;
            return;
        }
    }
}

void wait_next() {
    uint8_t next = 0;
    while (!next) {
        if (joypad() & J_A) {
            next = 1;
        }
    }
    delay(150);
}
