#pragma bank 2
#include <gb/gb.h>
#include "generate_dungeon.h"
#include "../maps/Obstacles.h"
#include "dungeon_management.h"

void assign_obstacles(uint8_t x, uint8_t y) BANKED {
    Coords obj_coords;
    uint8_t high_obj = obstacles[x][y] >> 4;
    uint8_t low_obj = obstacles[x][y] & 0x0F;
    switch (high_obj) {
        case 1:
            put_on_room(deco1, 0, 12, 6);
            break;
        case 2:
            put_on_room(deco2, 14, 12, 6);
            break;
        case 3:
            put_on_room(deco3, 14, 0, 6);
            break;
        case 4:
            put_on_room(deco4, 0, 0, 6);
            break;
        case 5:
            put_on_room(deco5, 10, 4, 4);
            break;
        case 6:
            put_on_room(deco5, 6, 8, 4);
            break;
    }

    switch (low_obj) {
        case 1:
            put_on_room(deco1, 0, 12, 6);
            break;
        case 2:
            put_on_room(deco2, 14, 12, 6);
            break;
        case 3:
            put_on_room(deco3, 14, 0, 6);
            break;
        case 4:
            put_on_room(deco4, 0, 0, 6);
            break;
        case 5:
            put_on_room(deco5, 10, 4, 4);
            break;
        case 6:
            put_on_room(deco5, 6, 8, 4);
            break;
    }
}

void put_on_room(unsigned char *obstacle, uint8_t x, uint8_t y, uint8_t size) BANKED {
    uint8_t tile;
    uint16_t room_idx;

    for (uint8_t r=0; r < size; r++) {
        for (uint8_t c = 0; c < size; c++) {
            tile = obstacle[(r*size) + c];
            if (tile > 3) {
                room_idx = ((y+r) * 20) + (x + c);
                current_room[room_idx] = tile;
            }
        }
    }
}

void set_room_tiles(uint8_t door, const unsigned char* room_ptr, Coords coord) BANKED {
    switch (door) {
    case 1:
        room_ptr = room1;
        break;
    case 2:
        room_ptr = room2;
        break;
    case 3:
        room_ptr = room3;
        break;
    case 4:
        room_ptr = room4;
        break;
    case 5:
        room_ptr = room5;
        break;
    case 6:
        room_ptr = room6;
        break;
    case 7:
        room_ptr = room7;
        break;
    case 8:
        room_ptr = room8;
        break;
    case 9:
        room_ptr = room9;
        break;
    case 10:
        room_ptr = room10;
        break;
    case 11:
        room_ptr = room11;
        break;
    case 12:
        room_ptr = room12;
        break;
    case 13:
        room_ptr = room13;
        break;
    case 14:
        room_ptr = room14;
        break;
    case 15:
        room_ptr = room15;
        break;
    }
    for (uint16_t i = 0; i<360; i++) {
        current_room[i] = room_ptr[i];
    }
    if (dungeon[coord.x][coord.y] == 'A' || dungeon[coord.x][coord.y] == 'B') {
        assign_obstacles(coord.x, coord.y);
    }
    set_bkg_tiles(0, 0, 20, 18, current_room);
}
