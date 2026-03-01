#pragma bank 3

#include <gb/gb.h>
#include "../maps/NameScreenMap.h"
#include "insert_name.h"

uint8_t char_option = 0;
uint8_t option_x = 24;
uint8_t option_y = 72;

uint8_t curr_letter = 0;

#define OFFSET 128

const unsigned char name_arrow[] =
{
  0x00,0xFF,0x00,0x81,0x00,0x81,0x00,0x81,
  0x00,0x81,0x00,0x81,0x00,0x81,0x00,0xFF
};


void insert_name() BANKED {
    set_sprite_data(4, 1, name_arrow);
    set_sprite_tile(0, 0); // player
    set_sprite_tile(1, 1);
    set_sprite_tile(2, 2);
    set_sprite_tile(3, 3);
    set_sprite_tile(4, 4); // selezionatore nome
    move_sprite(0, 136, 48);
    move_sprite(1, 144, 48);
    move_sprite(2, 136, 56);
    move_sprite(3, 144, 56);
    set_bkg_tiles(0, 0, 20, 18, NameMap);
    SHOW_SPRITES;
    DISPLAY_ON;
    while (1) {
        check_name_input();
        move_sprite(4, option_x, option_y);
        if (joypad() & J_START && player_name[0] != 164) {
        for (int i = 0; i < 5; i++) {
            if (player_name[i] == 164) {
                player_name[i] = 187;
            }
        }
        delay(150);
        return;
    }
        wait_vbl_done();
    }
}

void check_name_input() {
    if (joypad() & J_LEFT && char_option > 0) {
        char_option--;
        option_x -= 16;
        if (char_option % 8 == 7) {
            option_y-=16;
        }
        delay(100);
    }
    else if (joypad() & J_RIGHT && char_option < 35) {
        char_option++;
        option_x += 16;
        if (char_option % 8 == 0) {
            option_y+=16;
        }
        delay(100);
    }
    else if (joypad() & J_UP && char_option > 7) {
        char_option-=8;
        option_y-= 16;
        delay(100);
    }
    else if (joypad() & J_DOWN && char_option < 28) {
        char_option+=8;
        option_y+=16;
        delay(100);
    }
    else if (joypad() & J_A && curr_letter < 5) {
        player_name[curr_letter] = OFFSET + char_option;
        curr_letter++;
        set_bkg_tiles(8, 4, 5, 1, player_name);
        if (curr_letter == 5) {
            curr_letter = 4;
        }
        delay(150);
    }
    else if (joypad() & J_B && curr_letter >= 0) {
        
        player_name[curr_letter] = 164;
        curr_letter--;
        set_bkg_tiles(8, 4, 5, 1, player_name);
        if (curr_letter > 6) {
            curr_letter = 0;
        }
        delay(150);
    }
    if (char_option % 8 == 0) {
        option_x = 24;
    }
    else if (char_option % 8 == 3) {
        option_x = 72;
    }
    else if (char_option % 8 == 4) {
        option_x = 96;
    }
    else if (char_option % 8 == 7) {
        option_x = 144;
    }
}
