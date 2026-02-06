#include <gb/gb.h>
#include <stdio.h>
#include "src/tiles/character.c"
#include "src/tiles/CampTiles.c"
#include "src/maps/CampMap.c"
#include "src/tiles/Hector.c"
#include "src/tiles/Safy.c"
#include "src/tiles/DungeonTiles.c"
#include "src/maps/Dungeon.c"
#include "src/scripts/generate_dungeon.h"
#include "src/tiles/textbox.c"
#include "src/tiles/Text.c"
#include "src/tiles/mugshot.c"
#include "src/scripts/gui.h"

/* PROTOTYPES */

void move_character();
void check_input_movement();
uint8_t check_terrain(uint8_t new_x, uint8_t new_y);
uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y);
void set_camp_map();
void set_dungeon_map();
void set_room(Coords coord);
void change_room();
/* VARS */



int tile_id = 0;
uint8_t x = 120;
uint8_t y = 112;

Coords player_coords;
const unsigned char * current_room;


uint8_t last_joypad = 0;
uint8_t current_joypad = 0;

uint8_t hp = 23;
uint8_t attack = 7;
uint8_t defense = 5;




/* GAME VARS*/
uint8_t menu_opened = 0;
uint8_t current_location = 1; // 0 camp, 1 dungeon
uint8_t current_floor = 1;

void main(void) {
    cls();
    // start floor
    
    
    
    set_sprite_data(0, 4, Character);
    set_sprite_data(16, 4, Hector);
    set_sprite_data(20, 4, Safy);

    set_bkg_data(128, 47, Text);
    set_bkg_data(175, 9, Textbox);
    set_bkg_data(184, 16, Mugshot);

    set_win_tiles(0, 0, 20, 18, gui_map);

    if (current_location == 0){
        set_camp_map();
    }
    else {
        set_dungeon_map();
        generate_dungeon(current_floor);
        Coords start;
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                if (dungeon[i][j] == 'S') {
                    start.x = i;
                    start.y = j;
                    player_coords.x = i;
                    player_coords.y = j;
                }
            }
        }
        set_room(start);
    }

    set_sprite_tile(0, 0);
    set_sprite_tile(1, 1);
    set_sprite_tile(2, 2);
    set_sprite_tile(3, 3);
    move_character();

    SHOW_SPRITES;
    SHOW_BKG;
    SHOW_WIN;
    DISPLAY_ON;

    while(1) {
        check_input_movement();
        change_room();
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
    
    if (current_location != 0) {
        if (new_x < 8 || new_x > 160 || new_y < 16 || new_y > 152) {
            return 1; 
        }
    }

    
    int16_t gx = ((int16_t)new_x - 8) / 8;
    int16_t gy = ((int16_t)new_y - 16) / 8;

    if (gx < 0 || gx >= 20 || gy < 0 || gy >= 18) {
        return 0;
    }

    uint16_t tile_index = (uint16_t)gy * 20 + gx;

    if (current_location == 0) { 
        uint8_t tile_id = Camp[tile_index];             // collisioni campo
        if (camp_collisions[tile_id] == 1) return 0;
    } else {
        
        uint8_t tile_id = current_room[tile_index];     // collisioni dungeon
        if (tile_id > 3) return 0;
    }

    return 1;
}

uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y) {
    if (current_location == 0){
        if (target_x == 120 && target_y == 64) {
            return 1;
        }
    }
    return 0;
    
}

void set_camp_map(){
    set_bkg_tiles(0, 0, 20, 18, Camp);
    set_bkg_data(0, 108, CampTiles);


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
}

void set_dungeon_map(){
    set_bkg_data(0, 52, DungeonTiles);
}

void set_room(Coords coord){
    uint8_t door = doors[coord.x][coord.y];
    switch (door) {
    case 1:
        current_room = room1;
        break;
    case 2:
        current_room = room2;
        break;
    case 3:
        current_room = room3;
        break;
    case 4:
        current_room = room4;
        break;
    case 5:
        current_room = room5;
        break;
    case 6:
        current_room = room6;
        break;
    case 7:
        current_room = room7;
        break;
    case 8:
        current_room = room8;
        break;
    case 9:
        current_room = room9;
        break;
    case 10:
        current_room = room10;
        break;
    case 11:
        current_room = room11;
        break;
    case 12:
        current_room = room12;
        break;
    case 13:
        current_room = room13;
        break;
    case 14:
        current_room = room14;
        break;
    case 15:
        current_room = room15;
        break;
    }
    set_bkg_tiles(0, 0, 20, 18, current_room);
}

void change_room() {
    if (x > 160 && x < 240) {
        player_coords.x++;
        x = 8;
        set_room(player_coords);
    }
    else if (x > 240) {
        player_coords.x--;
        x = 152;
        set_room(player_coords);
    }
    else if (y > 144) {
        player_coords.y++;
        y = 16;
        set_room(player_coords);
    }
    else if (y < 8) {
        player_coords.y--;
        y = 144;
        set_room(player_coords);
    }
    move_character();
}