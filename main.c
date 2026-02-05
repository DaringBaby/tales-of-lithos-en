#include <gb/gb.h>
#include <stdio.h>
#include "src/tiles/character.c"
#include "src/tiles/CampTiles.c"
#include "src/maps/CampMap.c"
#include "src/tiles/Hector.c"
#include "src/tiles/Safy.c"


/* PROTOTYPES */

void move_character();
void check_input_movement();
uint8_t check_terrain(uint8_t new_x, uint8_t new_y);
uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y);
/* VARS */

int tile_id = 0;
uint8_t x = 120;
uint8_t y = 112;

uint8_t last_joypad = 0;
uint8_t current_joypad = 0;

uint8_t hp = 23;
uint8_t attack = 7;
uint8_t defense = 5;

uint8_t menu_opened = 0;



void main(void) {
    cls();


    set_bkg_data(0, 108, CampTiles);
    set_sprite_data(0, 4, Character);
    set_sprite_data(16, 4, Hector);
    set_sprite_data(20, 4, Safy);

    set_bkg_tiles(0, 0, 20, 18, Camp);

    set_sprite_tile(0, 0);
    set_sprite_tile(1, 1);
    set_sprite_tile(2, 2);
    set_sprite_tile(3, 3);

    set_sprite_tile(4, 16);
    set_sprite_tile(5, 17);
    set_sprite_tile(6, 18);
    set_sprite_tile(7, 19);

    set_sprite_tile(8, 20);
    set_sprite_tile(9, 21);
    set_sprite_tile(10, 22);
    set_sprite_tile(11, 23);


    move_sprite(4, 40, 64);
    move_sprite(5, 48, 64);
    move_sprite(6, 40, 72);
    move_sprite(7, 48, 72);

    move_sprite(8, 120, 64);
    move_sprite(9, 128, 64);
    move_sprite(10, 120, 72);
    move_sprite(11, 128, 72);



    move_character();

    SHOW_SPRITES;
    SHOW_BKG;
    DISPLAY_ON;

    while(1) {
        check_input_movement();
        wait_vbl_done();
    }
}

void move_character() {
    move_sprite(0, x, y);
    move_sprite(1, x+8, y);
    move_sprite(2, x, y + 8);
    move_sprite(3, x + 8, y + 8);
}

void check_input_movement() {
    if (joypad() & J_DOWN) {
        if (check_terrain(x + 8, y + 16 + 8) && !is_sprite_at(x, y + 16)) { 
            y += 16;
            move_character();
            delay(100);
        }
    }
    else if (joypad() & J_UP) {
        if (check_terrain(x + 8, y - 16 + 8) && !is_sprite_at(x, y - 16)) {
            y -= 16;
            move_character();
            delay(100);
        }
    }
    else if (joypad() & J_LEFT) {
        if (check_terrain(x - 16 + 8, y + 8) && !is_sprite_at(x-16, y)) {
            x -= 16;
            move_character();
            delay(100);
        }
    }
    else if (joypad() & J_RIGHT) {
        if (check_terrain(x + 16 + 8, y + 8) && !is_sprite_at(x+16, y)) {
            x += 16;
            move_character();
            delay(100);
        }
    } 
}

uint8_t check_terrain(uint8_t new_x, uint8_t new_y) {
    uint8_t grid_x = (new_x - 8) / 8;
    uint8_t grid_y = (new_y - 16) / 8; 

    uint16_t tile_index = (uint16_t)grid_y * 20 + grid_x;

    if (tile_index >= 360) return 0; 

    uint8_t tile_id = Camp[tile_index];

    if (camp_collisions[tile_id] == 1) {
        return 0; // wall
    }

    return 1;  // can walk
}

uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y) {
    if (target_x == 120 && target_y == 64) {
        return 1;
    }
    return 0;
}