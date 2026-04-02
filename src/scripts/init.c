#include "init.h"
#include "../maps/Title.h"
#include "../tiles/Titlescreen.h"
#include "../tiles/TitleText.h"
#include "../tiles/character.h"
#include "../tiles/Hector.h"
#include "../tiles/Safy.h"
#include "../tiles/Lock.h"
#include "../tiles/key.h"
#include "../tiles/mythril.h"
#include "../tiles/Arrow.h"
#include "../tiles/wpn_arrow.h"
#include "../tiles/enemyDrops.h"
#include "../tiles/numbers.h"
#include "../tiles/minimap.h"
#include "../tiles/Text.h"
#include "../tiles/textbox.h"
#include "../tiles/mugshot.h"
#include "../tiles/DungeonObjects.h"


const unsigned char blank[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
const unsigned char black[16] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};

void game_init() {
    cls();
    init_sound();
        __critical {
    add_VBL(music_vbl_interrupt);
    }
    set_title_data();
    DISPLAY_ON;
    ng = set_titlescreen();
    start_sfx();
    if (ng) {
        start_intro();
    }
    set_game_sprites();
    set_game_gui();
    if (!load_game()) {
        insert_name();
    }
    set_sprite_data(4, 4, MC_up);
    if (current_location == 0){
        set_camp_map();
    }
    else {
        go_into_dungeon();
    }
    if (ng) { // tutorial
        set_tutorial();
    }

    move_character();
    SHOW_SPRITES;
    SHOW_BKG;
    SHOW_WIN;
    delay(100);
}

void set_title_data() {
    SWITCH_ROM(2);
    set_bkg_data(0, 241, Titlescreen);
    set_bkg_data(241, 8, TitleText);
    set_bkg_tiles(0, 0, 20, 18, Title);
    SWITCH_ROM(1);
    current_song_bank = 5;
    SWITCH_ROM(current_song_bank);
    hUGE_init(&intro_theme);
    SWITCH_ROM(1);
}

void set_game_sprites() {
    set_sprite_data(0, 4, MC_down);
    set_sprite_data(8, 4, MC_right);
    set_sprite_data(12, 4, MC_left);
    set_sprite_data(16, 4, Hector);
    set_sprite_data(20, 4, Safy);
    set_sprite_data(50, 1, blank);
    set_sprite_data(51, 8, Lock);
    set_sprite_data(59, 2, Key);
    set_sprite_data(61, 4, Mythril);
    set_sprite_data(65, 12, Numbers);
    set_sprite_data(80, 2, Arrow);
    set_sprite_data(82, 2, Drops);
}

void set_game_gui() {
    SWITCH_ROM(3);
    set_bkg_data(108, 17, Minimap);
    SWITCH_ROM(2);
    set_bkg_data(128, 51, Text);
    SWITCH_ROM(1);
    set_bkg_data(179, 9, Textbox);
    set_bkg_data(188, 16, Mugshot);
    SWITCH_ROM(2);
    set_bkg_data(220, 4, MiniGUI);
    SWITCH_ROM(1);
    set_bkg_data(225, 20, Objects);
    set_bkg_data(245, 1, arrow);
    set_bkg_data(246, 1, black);
    move_win(7, 136);
    set_mini_menu();

    set_sprite_tile(4, 0);
    set_sprite_tile(5, 1);
    set_sprite_tile(6, 2);
    set_sprite_tile(7, 3);

    // mythrill

    set_sprite_tile(35, 61);
    set_sprite_tile(36, 62);
    set_sprite_tile(37, 63);
    set_sprite_tile(38, 64);
}
