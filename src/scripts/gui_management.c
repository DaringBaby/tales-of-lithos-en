#pragma bank 3

#include <gb\gb.h>
#include "gui_management.h"
#include "../tiles/minimap.h"



void check_map_options() BANKED {
    if (joypad() & J_UP && map_option > 0) {
        set_win_tiles(2, 4 + map_option*3, 1, 1, menu_body);
        map_option--;
        set_win_tiles(2, 4 + map_option*3, 1, 1, &arrow_tile);
        delay(150);
        }
    if (joypad() & J_DOWN && map_option < 2) {
        set_win_tiles(2, 4 + map_option*3, 1, 1, menu_body);
        map_option++;
        set_win_tiles(2, 4 + map_option*3, 1, 1, &arrow_tile);
        delay(150);
        }
    check_map_menu_input();
}

void check_map_menu_input() {
    if (joypad() & J_A) {
        switch (map_option) {
            case 0:
                move_win(7, 136);
                set_mini_menu();
                SHOW_SPRITES;
                menu_opened = 0;
                break;
            case 1:
                menu_opened = 6;
                set_win_tiles(0, 0, 20, 18, stats_menu);
                // stats menu
                uint8_t def_en[3];
                uint8_t pups[2];
                uint8_t mfloor[2];
                def_en[0] = enemies_defeated / 100 + 154;
                def_en[1] = enemies_defeated % 100 / 10 + 154;
                def_en[2] = enemies_defeated % 10 + 154;
                pups[0] = power_ups / 10 + 154;
                pups[1] = power_ups % 10 + 154;
                mfloor[0] = max_floor / 10 + 154;
                mfloor[1] = max_floor % 10 + 154;
                set_win_tiles(16, 4, 3, 1, def_en);
                set_win_tiles(17, 7, 2, 1, mfloor);
                set_win_tiles(17, 10, 2, 1, pups);
                show_time();
                delay(300);
                break;
            case 2:
                if (current_location == 1) {
                    menu_opened = 0;
                    game_over();
                    move_win(7, 136);
                    set_mini_menu();
                    set_camp_map();
                    x = 120;
                    y = 112;
                    move_character();
                    delay(100);
                    SHOW_WIN;
                    DISPLAY_ON;
                }
                break;
        }
    }
}

void show_time() BANKED {
    uint8_t t[8];
    t[0] = hours / 10 + 154;
    t[1] = hours % 10 + 154;
    t[2] = 177;
    t[3] = minutes / 10 + 154;
    t[4] = minutes % 10 + 154;
    t[5] = 177;
    t[6] = seconds / 10 + 154;
    t[7] = seconds % 10 + 154;
    set_win_tiles(11, 13, 8, 1, t);
}