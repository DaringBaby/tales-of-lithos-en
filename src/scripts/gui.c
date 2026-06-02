#include <gb/gb.h>
#include "scripts/gui.h"
/* GUI TILES */
#define OFFSET_UI 179
#define TOPLEFT     (OFFSET_UI + 0)
#define TOP         (OFFSET_UI + 1)
#define TOPRIGHT    (OFFSET_UI + 2)
#define RIGHT       (OFFSET_UI + 3)
#define BOTTOMRIGHT (OFFSET_UI + 4)
#define BOTTOM      (OFFSET_UI + 5)
#define BOTTOMLEFT  (OFFSET_UI + 6)
#define LEFT        (OFFSET_UI + 7)
#define BODY        (OFFSET_UI + 8)

/* SYMBOLS TILES */
#define OFFSET_CHAR 128
#define SWORD_LV 169
#define SHIELD_LV 170
#define ARROW_LV 171
#define QUIVER_LV 172
#define NUM_POT_LV 173
#define HEALING_LV 174
#define MYTHRIL 178
#define WHITESPACE 175
#define ZERO 154


const unsigned char gui_map[] = {
    TOPLEFT,  TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   164,   164,   140,   132,   141,   148,   164,   164,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   188,   189,   190,   191,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   192,   193,   194,   195,   BODY,   141,   128,   140,   132,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   196,   197,   198,   199,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   200,   201,   202,   203,   BODY,   135,   143,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   128,   147,   147,   128,   130,   138,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   131,   132,   133,   132,   141,   146,   132,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   SWORD_LV,   BODY,   BODY,   BODY,   BODY,   QUIVER_LV,   BODY,   BODY,   BODY,   BODY,   139,   149,   166,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   SHIELD_LV,   BODY,   BODY,   BODY,   BODY,   NUM_POT_LV,   BODY,   BODY,   BODY,   BODY,   132,   146,   166,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   ARROW_LV,   BODY,   BODY,   BODY,   BODY,   HEALING_LV,   BODY,   BODY,   BODY,   BODY,   MYTHRIL,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};

const unsigned char mini_gui[] = {
    135, 143,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   220,   BODY,   BODY,   221,   BODY,   BODY,   BODY,   222,   164,   BODY, BODY };

const unsigned char hector_menu[] = {
    TOPLEFT,  TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
    LEFT, BODY, 148, 143, 134, 145, 128, 131, 132, WHITESPACE, 146, 150, 142, 145, 131, BODY, BODY, BODY, BODY, RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT, BODY, 148, 143, 134, 145, 128, 131, 132, WHITESPACE, 146, 135, 136, 132, 139, 131, BODY, BODY, BODY, RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT, BODY, 148, 143, 134, 145, 128, 131, 132, WHITESPACE, 128, 145, 145, 142, 150, 146, BODY, BODY, BODY, RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT, BODY, 148, 143, 134, 145, 128, 131, 132, WHITESPACE, 144, 148, 136, 149, 132, 145, BODY, BODY, BODY, RIGHT,
    BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT,
    TOPLEFT,  TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
    LEFT,     BODY, 130,   142,   146,   147,   177,  BODY,  BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   130, 128, 145, 145, 136, 132, 131,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};

const unsigned char safy_menu[] = {
    TOPLEFT,  TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
    LEFT, BODY, 148, 143, 134, 145, 128, 131, 132, WHITESPACE, 135, 132, 128, 139, WHITESPACE, 130, 128, 143, 166, RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT, BODY, 148, 143, 134, 145, 128, 131, 132, WHITESPACE, 135, 143, WHITESPACE, 135, 132, 128, 139, 132, 131, RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT, BODY, 139, 132, 149, 132, 139, WHITESPACE, 148, 143, BODY, BODY, BODY, BODY, BODY, BODY, BODY, BODY, BODY, RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT,
    TOPLEFT,  TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
    LEFT,     BODY, 130,   142,   146,   147,   177,  BODY,  BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT, BODY, 142, 129, 147, 128, 136, 141, 132, 131, 177, BODY, BODY, BODY, BODY, BODY, BODY, BODY, BODY, RIGHT,
    BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};

const unsigned char obtained_key[] = {
    TOPLEFT,  TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
        LEFT,     135,   139,   142,   142,   145,   BODY,   138,   132,   152,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
        LEFT,     BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  RIGHT,
        LEFT,     142,   129,   147,   128,   136,   141,   132,   131,   167,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
        BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};

const unsigned char obtained_mythril[] = {
    TOPLEFT,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
        LEFT,       140,    152,    147,    135,    145,    136,    139,    BODY,   142,    129,    147,    128,    136,    141,    132,    131,    167,    BODY,   RIGHT,
        LEFT,     BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  RIGHT,
        LEFT,     BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  RIGHT,
        BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};

const unsigned char boss_defeated[] = {
    TOPLEFT,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
        LEFT,       129,    142,    146,    146,    WHITESPACE, 131,    132,    133,    132,    128,    147,    132,    131,    167,    WHITESPACE, 156,    BODY,   BODY,   RIGHT,
        LEFT,     BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  BODY,  RIGHT,
        LEFT,       140,    152,    147,    135,    145,    136,    139,    BODY,   142,    129,    147,    128,    136,    141,    132,    131,    167,    BODY,   RIGHT,
        BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};

const unsigned char game_saved[] = {
    TOPLEFT,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
    LEFT,       134,    128,    140,    132,    WHITESPACE, 146,    128,    149,    132,    131,    167,    BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,       BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,       BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};


void check_open_menu() {
    current_joypad = joypad();
    if ((current_joypad & J_START) && !(last_joypad & J_START)) {
        if (menu_opened == 0){
            DISPLAY_OFF;
            move_win(7, 0);
            set_win_tiles(0, 0, 20, 18, gui_map);
            set_stats();
            HIDE_SPRITES;
            DISPLAY_ON;
            menu_opened = 1;
        }
        else if (menu_opened == 1) {
            DISPLAY_OFF;
            move_win(7, 136);
            set_mini_menu();

            SHOW_SPRITES;
            menu_opened = 0;
            DISPLAY_ON;
        }
    }
    if ((current_joypad & J_SELECT) && !(last_joypad & J_SELECT)) {
        if (menu_opened == 0){
            DISPLAY_OFF;
            move_win(7, 0);
            SWITCH_ROM(3);
            set_win_tiles(0, 0, 20, 18, map_menu);
            SWITCH_ROM(1);
            set_map_menu();
            map_option = 0;
            set_win_tiles(2, 4, 1, 1, &arrow_tile);
            HIDE_SPRITES;
            menu_opened = 5;
            DISPLAY_ON;
        }
        else if (menu_opened == 5) {
            DISPLAY_OFF;
            move_win(7, 136);
            set_mini_menu();

            SHOW_SPRITES;
            menu_opened = 0;
            DISPLAY_ON;
        }
    }
    last_joypad = current_joypad;
}


void set_textbox(uint8_t item) {
    menu_opened = 4;
    move_win(7, 104);
    if (item == 0) {
        set_win_tiles(0, 0, 20, 5, game_saved);
    }
    else if (item == 1) {
        move_sprite(33, x, y-32);
        move_sprite(34, x+8, y-32);
        set_win_tiles(0, 0, 20, 5, obtained_key);
    }
    else if (item == 2) {
        move_sprite(35, x, y-32);
        move_sprite(36, x+8, y-32);
        move_sprite(37, x, y-24);
        move_sprite(38, x+8, y-24);
        set_win_tiles(0, 0, 20, 5, obtained_mythril);
    }
    else if (item == 3) {
        HIDE_SPRITES;
        set_win_tiles(0, 0, 20, 5, boss_defeated);
    }

    wait_vbl_done();

    while(!(joypad() & (J_A))) {
        wait_vbl_done();
    }

    while(joypad() & (J_A)) {
        wait_vbl_done();
    }

    move_sprite(33, 0, 0);
    move_sprite(34, 0, 0);
    move_sprite(35, 0, 0);
    move_sprite(36, 0, 0);
    move_sprite(37, 0, 0);
    move_sprite(38, 0, 0);
    menu_opened = 0;
    SHOW_SPRITES;
    set_mini_menu();
}

void set_tutorial() {
        move_win(7,0);
        move_sprite(4, 0, 0);
        move_sprite(8, 24, 40);
        move_sprite(9, 32, 40);
        move_sprite(10, 24, 48);
        move_sprite(11, 32, 48);
        move_sprite(12, 24, 80);
        move_sprite(13, 32, 80);
        move_sprite(14, 24, 88);
        move_sprite(15, 32, 88);
        SWITCH_ROM(3);
        set_win_tiles(0, 0, 20, 18, TutorialMap);
        SHOW_SPRITES;
        SHOW_WIN;
        while (1) {
            if (joypad() & J_A) {
                move_sprite(8, 40, 64);
                move_sprite(9, 48, 64);
                move_sprite(10, 40, 72);
                move_sprite(11, 48, 72);
                move_sprite(12, 120, 64);
                move_sprite(13, 128, 64);
                move_sprite(14, 120, 72);
                move_sprite(15, 128, 72);
                return;
            }
        }
}
