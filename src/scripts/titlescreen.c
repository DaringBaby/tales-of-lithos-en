#include "titlescreen.h"
#include "../tiles/Titlescreen.c"
#include "../tiles/TitleText.c"
#include "../maps/Title.c"

void set_titlescreen() {
    set_bkg_data(0, 241, Titlescreen);
    set_bkg_data(241, 8, TitleText);
    set_bkg_tiles(0, 0, 20, 18, Title);

    uint8_t press_start[] = {241, 242, 243, 244, 245, 1, 1, 246, 247, 248, 242, 247};
    uint8_t empty[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
    set_bkg_tiles(4, 16, 12, 1, press_start);
    uint8_t frame = 0;
    SHOW_BKG;
    while (1) {
    wait_vbl_done();
    if (joypad() & J_START) {
        delay(150);
        DISPLAY_OFF;
        delay(150);
        return;
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