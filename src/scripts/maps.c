#include "scripts/maps.h"
#include "scripts/game_vars.h"
#include "tiles/DungeonTiles.h"
#include "tiles/DungeonTiles2.h"
#include "tiles/DungeonTiles3.h"
#include "tiles/DungeonTiles4.h"
#include "tiles/DungeonTiles5.h"
#include "maps/Dungeon.h"
#include "tiles/CampTiles.h"
#include "maps/CampMap.h"
#include "tiles/Hector.h"
#include "tiles/Safy.h"

const uint8_t chest_closed[] = {225, 226, 227, 228, 229, 230, 231, 232};
const uint8_t chest_opened[] = {233, 234, 235, 236, 237, 238, 239, 240};


void set_camp_map(){
    set_sprite_tile(4, 4);
    set_sprite_tile(5, 5);
    set_sprite_tile(6, 6);
    set_sprite_tile(7, 7);
    set_sprite_data(16, 4, Hector);
    set_sprite_data(20, 4, Safy);
    SWITCH_ROM(2);
    set_bkg_data(0, 108, CampTiles);
    set_bkg_tiles(0, 0, 20, 18, Camp);
    SWITCH_ROM(1);


    set_sprite_tile(8, 16);
    set_sprite_tile(9, 17);
    set_sprite_tile(10, 18);
    set_sprite_tile(11, 19);

    set_sprite_tile(12, 20);
    set_sprite_tile(13, 21);
    set_sprite_tile(14, 22);
    set_sprite_tile(15, 23);


    move_sprite(8, 40, 64);
    move_sprite(9, 48, 64);
    move_sprite(10, 40, 72);
    move_sprite(11, 48, 72);

    move_sprite(12, 120, 64);
    move_sprite(13, 128, 64);
    move_sprite(14, 120, 72);
    move_sprite(15, 128, 72);
    empty_map_tiles();
    play_song(5);
}


void hide_camp_sprites() {

    set_sprite_tile(8, 50);
    set_sprite_tile(9, 50);
    set_sprite_tile(10, 50);
    set_sprite_tile(11, 50);

    set_sprite_tile(12, 50);
    set_sprite_tile(13, 50);
    set_sprite_tile(14, 50);
    set_sprite_tile(15, 50);
    move_sprite(8, 0, 0);
    move_sprite(9, 0, 0);
    move_sprite(10, 0, 0);
    move_sprite(11, 0, 0);

    move_sprite(12, 0, 0);
    move_sprite(13, 0, 0);
    move_sprite(14, 0, 0);
    move_sprite(15, 00, 0);
}

void set_dungeon_map(){
    if (current_floor <= 5) {
        SWITCH_ROM(2);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles);
    }
    else if (current_floor <= 10) {
        SWITCH_ROM(2);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles2);
    }
    else if (current_floor <= 15) {
        SWITCH_ROM(5);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles3);
    }
    else if (current_floor <= 20) {
        SWITCH_ROM(5);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles4);
    }
    else {
        SWITCH_ROM(5);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles5);
    }
    SWITCH_ROM(1);
}

void set_room(Coords coord){
    set_dungeon_map();
    uint8_t door = doors[coord.x][coord.y];
    const unsigned char* room_ptr;
    set_room_tiles(door, room_ptr, coord);
    hide_door();
    if (dungeon[coord.x][coord.y] == 'K') {
        if (key_obtained == 0){
            set_bkg_tiles(8, 6, 4, 2, chest_closed);
        }
        else {
            set_bkg_tiles(8, 6, 4, 2, chest_opened);
        }
    }
    else if (dungeon[coord.x][coord.y] == 'L') {
        if (lock_opened == 0) {
            switch (locked_door) {
                case 1:
                    draw_lock_v(72, 16);
                    break;
                case 2:
                    draw_lock_h(152, 80);
                    break;
                case 4:
                    draw_flip_lock_v(72, 144);
                    break;
                case 8:
                    draw_flip_lock_h(8, 80);
                    break;
            }
        }
    }
    else if (dungeon[coord.x][coord.y] == 'T') {
        if (treasure_obtained == 0){
            set_bkg_tiles(8, 6, 4, 2, chest_closed);
        }
        else {
            set_bkg_tiles(8, 6, 4, 2, chest_opened);
        }
    }
    else if (dungeon[coord.x][coord.y] == 'E' && current_floor % 5 != 0 || dungeon[coord.x][coord.y] == 'E' && current_floor % 5 == 0 && boss_floor_defeated) {
        set_bkg_tiles(2, 2, 2, 2, stairs);
    }
    // spawna nemici
    spawn_enemies_in_room(coord.x, coord.y, current_enemies);
    clear_drops();
    if (dungeon[coord.x][coord.y] != 'E') {
        set_enemy_sprite();
    }
    else if (current_floor % 5 == 0 && boss_floor_defeated == 0) {
        boss_battle = 1;
        spawn_boss(&boss);
        smooth_movement(last_direction);
        SWITCH_ROM(2);
        for (uint16_t i; i<360; i++) {
            current_room[i] = NoExit[i];
        }
        set_bkg_tiles(0, 0, 20, 18, current_room);
        SWITCH_ROM(1);
        play_song(4);
    }
    DISPLAY_ON;
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
        set_sprite_tile(6, 2);
        set_sprite_tile(7, 3);
        set_room(player_coords);
    }
    else if (y < 8) {
        player_coords.y--;
        y = 144;
        set_room(player_coords);
    }
    move_character();
}

void return_to_camp() {
    menu_opened = 0;
    play_song(0);
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
    return;
}

void go_into_dungeon() {
    wait_vbl_done();
    DISPLAY_OFF;
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
    if (max_floor == 0) {
        max_floor = 1;
    }
}

void go_next_floor() {
    current_floor++;
    if (current_floor % 5 == 0) {
        boss.defeated = 1;
        boss_floor_defeated = 0;
    }
    if (current_floor > max_floor) {
        max_floor = current_floor;
    }
    key_obtained = 0;
    treasure_obtained = 0;
    lock_opened = 0;
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
